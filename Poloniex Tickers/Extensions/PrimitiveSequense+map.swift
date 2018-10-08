//
//  PrimitiveSequense+map.swift
//  Poloniex Tickers
//
//  Created by Андрей Раевнёв on 29/09/2018.
//  Copyright © 2018 venvear. All rights reserved.
//

import Foundation
import RxSwift
import Moya

fileprivate let customDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    return decoder
}()

extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
    
    public func decode<D: Decodable>(_ type: D.Type) -> Observable<D> {
        return map(type, atKeyPath: nil, using: customDecoder, failsOnEmptyData: true).asObservable()
    }
}
