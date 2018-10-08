//
//  TickersService.swift
//  Poloniex Tickers
//
//  Created by Андрей Раевнёв on 29/09/2018.
//  Copyright © 2018 venvear. All rights reserved.
//

import Foundation
import RxSwift
import Moya

class TickersService {
    
    var provider: MoyaProvider<PoloniexAPI>!
    
    func fetchTickers() -> Observable<TickersResponse> {
        return provider.rx.request(.getTickers(), callbackQueue: DispatchQueue.main)
            .decode(TickersResponse.self)
    }
    
}
