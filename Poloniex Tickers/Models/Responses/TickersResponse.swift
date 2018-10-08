//
//  TickersResponse.swift
//  Poloniex Tickers
//
//  Created by Андрей Раевнёв on 29/09/2018.
//  Copyright © 2018 venvear. All rights reserved.
//

import Foundation

class TickersResponse: Decodable {
    var tickers: [String: Ticker]
    
    private struct CodingKeys: CodingKey {
        var intValue: Int?
        var stringValue: String
        
        init?(intValue: Int) { self.intValue = intValue; self.stringValue = "" }
        init?(stringValue: String) { self.stringValue = stringValue }
    }
    
    required init(from decoder: Decoder) throws {
        self.tickers = [:]
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        for key in container.allKeys {
            let tickerName = key.stringValue
            let tickerDetail = try container.decode(Ticker.self, forKey: key)
            
            self.tickers[tickerName] = tickerDetail
        }
    }
}

