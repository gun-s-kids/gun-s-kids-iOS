//
//  ClubInfoResponse.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/03/26.
//

import Foundation

struct ClubInfoResponse: Codable {
    let status: String
    let code: Int
    let data: ClubInfo
}

struct ClubInfo: Codable {
    let clubNo: Int
    let companyNm: String?
    let clubNm: String
    let clubDesc: String
    let clubImg: String
    let createdDate: String
    let adminList: [MemberInfo]
}

struct MemberInfo: Codable, Identifiable {
    let id = UUID()
    let memberNo: Int
    let memberNm: String?
    let nickname: String
    let companyNm: String?
    let role: String
    let profileImg: String?
    let introduction: String?
    let roleNo: Int?
    
    private enum CodingKeys: String, CodingKey {
        case memberNo
        case memberNm
        case nickname
        case companyNm
        case role
        case profileImg
        case introduction
        case roleNo
    }
}
