//
//  ClubListResponse.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/01/21.
//

import Foundation

struct ClubListResponse: Codable {
    let status: String
    let code: Int
    let data: [Datum]
}

struct Datum: Codable, Identifiable {
    let id = UUID()
    let clubNo, companyNo: Int
    let clubNm: String
    let clubImg: String
    
    private enum CodingKeys: String, CodingKey {
        case clubNo
        case companyNo
        case clubNm
        case clubImg
    }
}
