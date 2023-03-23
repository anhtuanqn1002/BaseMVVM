//
//  Constant.swift
//  BaseMVVM
//
//  Created by Tuan Nguyen on 13/03/2023.
//

import Foundation

enum Constant {}
extension Constant {
    enum API {
        static var baseURLString: String {
            "https://cat-fact.herokuapp.com"
        }
        
        static var baseHeader: [String: String] {
            ["Content-Type": "application/json"]
        }
    }
}
