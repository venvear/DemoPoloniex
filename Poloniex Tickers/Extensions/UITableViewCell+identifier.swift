//
//  UITableViewCell+identifier.swift
//  Poloniex Tickers
//
//  Created by Андрей Раевнёв on 29/09/2018.
//  Copyright © 2018 venvear. All rights reserved.
//

import UIKit

extension UITableViewCell {
    class var identifier: String { return String(describing: self) }
}

extension UITableViewHeaderFooterView {
    class var identifier: String { return String(describing: self) }
}
