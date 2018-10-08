//
//  String+localization.swift
//  Poloniex Tickers
//
//  Created by Андрей Раевнёв on 01/10/2018.
//  Copyright © 2018 venvear. All rights reserved.
//

import Foundation

public extension String {
    
    enum Localization {
        static let error = "error".localized()
        static let loadError = "load_error".localized()
        static let emptyData = "empty_data".localized()
        static let tickers = "tickers".localized()
        static let about = "about".localized()
        static let coin = "coin".localized()
        static let price = "price".localized()
        static let highestBid = "highest_bid".localized()
        static let version = "version".localized()
    }
}
