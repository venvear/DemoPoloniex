//
//  PoloniexAPI.swift
//  Poloniex Tickers
//
//  Created by Андрей Раевнёв on 29/09/2018.
//  Copyright © 2018 venvear. All rights reserved.
//

import Moya

enum PoloniexAPI {
    case getTickers()
}

extension PoloniexAPI: TargetType {
    
    var baseURL: URL { return URL(string: "https://poloniex.com")! }
    
    var headers: [String: String]? {
        return [:]
    }
    
    var sampleData: Data { return Data() }
    
    var path: String {
        switch self {
        case .getTickers():
            return "/public"
        }
    }
    
    var method: Method {
        switch self {
        case .getTickers:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getTickers():
            let params = ["command": "returnTicker"]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
}
