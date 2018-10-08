//
//  TickersModel.swift
//  Poloniex Tickers
//
//  Created by Андрей Раевнёв on 29/09/2018.
//  Copyright © 2018 venvear. All rights reserved.
//

import Foundation

struct TickerModel: Equatable {
    let name: String
    let tickerInfo: Ticker
    
    static func == (lhs: TickerModel, rhs: TickerModel) -> Bool {
        return lhs.tickerInfo.id == rhs.tickerInfo.id
    }
}
