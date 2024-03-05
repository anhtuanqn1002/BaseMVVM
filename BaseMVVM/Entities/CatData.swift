//
//  CatData.swift
//  BaseMVVM
//
//  Created by Tuan Nguyen on 05/03/2024.
//

import Foundation

struct CatData: Codable {
    struct Status: Codable {
        let verified: Bool?
        let sentCount: Int?
    }
    
    let status: Status?
    let id: String?
    let user: String?
    let text: String?
    let type: String?
    let deleted: Bool?
    let createdAt: String?
    let updatedAt: String?
    let version: Int?
    
    enum CodingKeys: String, CodingKey {
        case status
        case id = "_id"
        case user, text, type, deleted, createdAt, updatedAt
        case version = "__v"
    }
}
