//
//  Environments.swift
//  BaseMVVM
//
//  Created by Tuan Nguyen on 21/11/2022.
//

import Foundation
enum AppEnvironment: String {
    case development = "Development"
    case staging = "Staging"
    case production = "Production"
    case unknown = ""
    
    static var current: AppEnvironment {
        AppEnvironment(rawValue: ConfigurationKey.appEnvironmentName.value ?? "") ?? .unknown
    }
}
