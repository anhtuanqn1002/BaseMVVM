//
//  AppError.swift
//  BaseMVVM
//
//  Created by Tuan Nguyen on 05/03/2024.
//

import Foundation

enum AppError: Error {
    case parsing(description: String)
    case network(description: String)
}
