//
//  SignUpResponse.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/03/16.
//

import Foundation

struct SignUpResponse: Codable {
    let status: String
    let code: Int
    let message: String
}
