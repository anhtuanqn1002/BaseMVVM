//
//  ConfigKeys.swift
//  BaseMVVM
//
//  Created by Tuan Nguyen on 21/11/2022.
//

import Foundation

enum ConfigurationKey: String {
    case appName = "APP_DISPLAY_NAME"
    case appVersion = "APP_BUILD_VERSION"
    case appBuildNumber = "APP_BUILD_NUMBER"
    case baseURL = "BASE_URL"
    case appEnvironmentName = "APP_ENVIRONMENT"
    
    var value: String? {
        return (Bundle.main.infoDictionary?[self.rawValue] as? String)?.replacingOccurrences(of: "\\", with: "")
    }
}
