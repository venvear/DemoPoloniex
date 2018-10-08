//
//  TickersView.swift
//  Poloniex Tickers
//
//  Created by Андрей Раевнёв on 29/09/2018.
//  Copyright © 2018 venvear. All rights reserved.
//

import Foundation

protocol TickersView: class {
   
    func showLoading(loading: Bool)
    func showLoadedTickers(tickers: [TickerModel])
    func updateTickers(tickers: [TickerModel])
    func didFailLoadTickers(message: String)
    
}
