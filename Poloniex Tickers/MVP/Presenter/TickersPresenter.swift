//
//  TickersPresenter.swift
//  Poloniex Tickers
//
//  Created by Андрей Раевнёв on 29/09/2018.
//  Copyright © 2018 venvear. All rights reserved.
//

import Foundation
import RxSwift
import Moya

class TickersPresenter {
    
    weak var view: TickersView!
    
    var tickersService: TickersService!
    
    var repeatableLoadTickers: Disposable?
    var tickers: [String: Ticker] = [:]
    
    var loading = false
    var firstLoaded = false
    var disappeared = false
    
    func viewLoaded() {
    }
    
    func viewAppeared() {
        disappeared = false
        
        load()
    }
    
    func viewDisappeared() {
        disappeared = true
        
        // если первый раз загрузка завершилась, тогда отключаем таймер
        if firstLoaded {
            repeatableLoadTickers?.dispose()
            repeatableLoadTickers = nil
            
            view.showLoading(loading: false)
        }
    }
    
    func resresh() {
        guard repeatableLoadTickers == nil else {
            return
        }
        
        load()
    }
    
    private func load() {
        if loading {
            return
        }
        
        repeatableLoadTickers = Observable<Int>.timer(0, period: 5.0, scheduler: MainScheduler.asyncInstance)
            .map { [weak self] (value) -> Int in
                self?.loading = true
                self?.view.showLoading(loading: true)
                return value
            }.flatMap { [weak tickersService] (value) -> Observable<TickersResponse> in
                return tickersService?.fetchTickers() ?? Observable.empty()
            }.subscribe(onNext: { [weak self] (tickersResponse) in
                
                self?.showLoadedTickers(loadedTickers: tickersResponse.tickers)
                self?.loadComplete()
                
                }, onError: { [weak self] (error) in
                    
                    self?.loadComplete(withError: true)
                    
                    let message = "\(String.Localization.loadError)\n\(error.localizedDescription)"
                    self?.view.didFailLoadTickers(message: message)
            })
    }
    
    private func loadComplete(withError: Bool? = nil) {
        view.showLoading(loading: false)
        
        firstLoaded = true
        loading = false
        
        // Если это окончание первой загрузки, а мы уже ушли с экрана, тогда отключаем таймер || или если ошибка
        if disappeared || withError != nil {
            repeatableLoadTickers?.dispose()
            repeatableLoadTickers = nil
        }
    }
    
    
    private func showLoadedTickers(loadedTickers: [String: Ticker]) {
        if tickers.count == 0 {
            tickers = loadedTickers
            
            var tickerModels = [TickerModel]()
            for (name, ticker) in tickers {
                tickerModels.append(TickerModel(name: name, tickerInfo: ticker))
            }
            
            view.showLoadedTickers(tickers: tickerModels)
        } else {
            var changedTickers: [String: Ticker] = [:]
            loadedTickers.forEach { (name, ticker) in
                if let oldTicker = tickers[name], oldTicker == ticker {
                } else {
                    tickers[name] = ticker
                    changedTickers[name] = ticker
                }
            }
            
            var updatedTickerModels = [TickerModel]()
            for (name, ticker) in changedTickers {
                updatedTickerModels.append(TickerModel(name: name, tickerInfo: ticker))
            }
            
            view.updateTickers(tickers: updatedTickerModels)
        }
        
    }
    
}
