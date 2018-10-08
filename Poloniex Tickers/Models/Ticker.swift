//
//  Ticker.swift
//  Poloniex Tickers
//
//  Created by Андрей Раевнёв on 29/09/2018.
//  Copyright © 2018 venvear. All rights reserved.
//

import Foundation

struct Ticker: Decodable, Equatable {
    
    var id: Int
    var last: String
    var lowestAsk: String
    var highestBid: String
    var percentChange: String
    var baseVolume: String
    var quoteVolume: String
    var isFrozen: String
    var high24hr: String
    var low24hr: String
    
    enum CodingKeys: String, CodingKey {
        case id, last, lowestAsk, highestBid, percentChange, baseVolume, quoteVolume, isFrozen, high24hr, low24hr
    }
    
    static func == (lhs: Ticker, rhs: Ticker) -> Bool {
        return lhs.id == rhs.id && lhs.last == rhs.last
    }
    
}
