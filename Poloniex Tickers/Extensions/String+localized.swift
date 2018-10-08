//
//  String+localized.swift
//  Poloniex Tickers
//
//  Created by Андрей Раевнёв on 01/10/2018.
//  Copyright © 2018 venvear. All rights reserved.
//

import Foundation

public extension String {
    
    public func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
}
