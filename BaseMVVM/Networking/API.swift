//
//  API.swift
//  BaseMVVM
//
//  Created by Tuan Nguyen on 13/03/2023.
//

import Foundation
import Moya

enum Sample {
    case facts
}

extension Sample: TargetType {
    var baseURL: URL {
        return URL(string: Constant.API.baseURLString)!
    }
    
    var path: String {
        switch self {
        case .facts:
            return "/facts/random"
        default:
            return ""
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
        case .facts:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        Constant.API.baseHeader
    }
}

class SampleAPI {
    var provider = MoyaProvider<Sample>()
    
    init(provider: MoyaProvider<Sample> = MoyaProvider<Sample>()) {
        self.provider = provider
    }
    
    func getFacts() {
        provider.request(.facts, callbackQueue: .main) { progress in
            log?.debug("Moya progress \(progress)")
        } completion: { result in
            switch result {
            case .failure(let error):
                log?.debug("===> error \(error)")
            case .success(let response):
                let json = String(data: response.data, encoding: .utf8)
                log?.debug("===> status code = \(response.statusCode) - json: \(json)")
            }
        }
    }
}
