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
    let data: [Club]
}

struct Club: Codable, Identifiable {
    let id = UUID()
    let clubNo: Int
    let companyNm: String
    let clubNm: String
    let clubImg: String
    let memberCount: Int
    let createdDate: String
    
    private enum CodingKeys: String, CodingKey {
        case clubNo
        case companyNm
        case clubNm
        case clubImg
        case memberCount
        case createdDate
    }
}
