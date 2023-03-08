//
//  User.swift
//  FriendFace
//
//  Created by Faizaan Khan on 3/8/23.
//

import Foundation

struct Friends: Codable {
    let id: UUID
    let name: String
}

struct User: Codable {
    let id: UUID
    var isActive : Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friends]
}

struct Response: Codable {
    var results: [User]
}
