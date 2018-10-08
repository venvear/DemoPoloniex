//
//  UIDevice+model.swift
//  Poloniex Tickers
//
//  Created by Андрей Раевнёв on 30/09/2018.
//  Copyright © 2018 venvear. All rights reserved.
//

import UIKit

enum Device {
    case iPhone5
    case iPhone8
    case iPhone8plus
    case iPhoneX
    
    case notiPhone
}

extension UIDevice {
    
    var device: Device {
        if UIDevice.current.userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                return .iPhone5
            case 1334:
                return .iPhone8
            case 2208:
                return .iPhone8plus
            case 2436:
                fallthrough
            default:
                return .iPhoneX
            }
        }
        return .notiPhone
    }
}
