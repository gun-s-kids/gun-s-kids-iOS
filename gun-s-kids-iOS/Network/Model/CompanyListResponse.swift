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

struct CompanyInfo: Codable {
    let companyNo: Int
    let companyNm: String
    let companyImg: String
}

