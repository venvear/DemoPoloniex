//
//  TickerCellViewModel.swift
//  Poloniex Tickers
//
//  Created by Андрей Раевнёв on 29/09/2018.
//  Copyright © 2018 venvear. All rights reserved.
//

import UIKit

class TickerCellViewModel: CellViewModel {
    var tickerModel: TickerModel
    
    init(tickerModel: TickerModel) {
        self.tickerModel = tickerModel
    }
    
    var mainCurrency: String {
        let currencies = tickerModel.name.split(separator: "_")
        if currencies.count == 2 {
            return "\(currencies[1])"
        } else {
            return tickerModel.name
        }
    }
    
    var secondCurrency: String {
        let currencies = tickerModel.name.split(separator: "_")
        if currencies.count == 2 {
            return "\(currencies[0])"
        } else {
            return tickerModel.name
        }
    }
    
    var price: String {
        return tickerModel.tickerInfo.last
    }
    
    var highest: String {
        return tickerModel.tickerInfo.highestBid
    }
    
    var percent: Float {
        if let percentFloat = Float(tickerModel.tickerInfo.percentChange) {
            return percentFloat * 100
        }
        
        return 0
    }
}

extension TickerCellViewModel {
    func setup(cell: TickerCellView) {
        
        cell.titleLabel.text = mainCurrency
        cell.priceLabel.text = "\(price) \(secondCurrency)"
        cell.highestLabel.text = "\(highest) \(secondCurrency)"

        if percent >= 0 {
            cell.percentLabel.textColor = UIColor(rgbaValue: 0x74C574ff)
            cell.percentLabel.text = String(format: "+%.2f%%", percent)
        } else {
            cell.percentLabel.textColor = UIColor(rgbaValue: 0xF74C3Cff)
            cell.percentLabel.text = String(format: "%.2f%%", percent)
        }
    }
}
