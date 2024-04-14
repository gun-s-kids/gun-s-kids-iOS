//
//  BaseResponse.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/03/20.
//

import Foundation

struct BaseResponse: Codable {
    let status: String
    let code: Int
    let message: String
}
