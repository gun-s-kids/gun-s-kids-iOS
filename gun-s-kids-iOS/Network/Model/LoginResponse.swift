//
//  LoginResponse.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/03/18.
//

import Foundation

struct LoginResponse: Codable {
    let status: String
    let code: Int
    let data: Tokens
}

struct Tokens: Codable {
    let accessToken: String
    let refreshToken: String
}
