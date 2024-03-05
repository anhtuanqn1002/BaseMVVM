//
//  API.swift
//  BaseMVVM
//
//  Created by Tuan Nguyen on 13/03/2023.
//

import Combine
import Moya

enum CatFacts {
    case facts
}

extension CatFacts: TargetType {
    var baseURL: URL {
        guard let url = URL(string: Constant.API.baseURLString) else {
            fatalError("Invalid base URL string: \(Constant.API.baseURLString)")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .facts:
            return "/facts/random"
//        default:
//            return ""
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
        case .facts:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
//        default:
//            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        Constant.API.baseHeader
    }
}

class CatFactsAPI {
    var provider = MoyaProvider<CatFacts>()
    var cancellables = Set<AnyCancellable>()

    init(provider: MoyaProvider<CatFacts> = MoyaProvider<CatFacts>()) {
        self.provider = provider
    }
    
    func getFacts() -> AnyPublisher<CatData, Error> {
        return provider.requestPublisher(.facts, callbackQueue: .main)
            .map(\.data)
            .decode(type: CatData.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
