//
//  CompanyListResponse.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/01/11.
//

import Foundation

struct CompanyListResponse: Codable {
    let status, message: String
    let data: [CompanyInfo]
}

struct CompanyInfo: Codable, Identifiable {
    let id = UUID()
    let companyNo: Int
    let companyNm: String
    let companyImg: String
    
    private enum CodingKeys: String, CodingKey {
        case companyNo
        case companyNm
        case companyImg
    }
}
