//
//  StringDataResponse.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/04/14.
//

import Foundation

struct StringDataResponse: Codable {
    let status: String
    let code: Int
    let data: String
}
