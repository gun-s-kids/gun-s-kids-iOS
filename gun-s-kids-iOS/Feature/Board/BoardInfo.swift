//
//  BoardInfo.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/01/28.
//

import Foundation

struct BoardInfo: Codable, Identifiable {
    let id = UUID()
    let companyNm: String
    let nickname: String
    let profileImg: String
    let title: String
    let description: String
    let createdDate: String
    let likeCount: Int
    let commentCount: Int
    
    private enum CodingKeys: String, CodingKey {
        case companyNm
        case nickname
        case profileImg
        case title
        case description
        case createdDate
        case likeCount
        case commentCount
    }
    
    static let sample: [BoardInfo] = [
        BoardInfo(companyNm: "한섬", nickname: "볼빵빵짱구", profileImg: "fig", title: "23.09.04 정모 후기!!", description: "너무너무재밌었어요옹너무너무 재밌었어요옹너무너무너무너무너무넌무너무무너무너뭐뭐무머눠눤", createdDate: "방금 전", likeCount: 4, commentCount: 3),
        BoardInfo(companyNm: "현대 IT&E", nickname: "볼빵빵바트", profileImg: "banana", title: "치이카와 너무 귀엽지 않아??", description: "치아카와 너무 귀여워><", createdDate: "3분 전", likeCount: 3, commentCount: 1),
        BoardInfo(companyNm: "현대홈쇼핑", nickname: "까만썬그리", profileImg: "lemon", title: "23.09.04 정모 후기!!", description: "너무너무재밌었어요옹너무너무 재밌었어요옹너무", createdDate: "01.12. 14:23", likeCount: 2, commentCount: 2),
        BoardInfo(companyNm: "현대백화점 면세점", nickname: "볼빵빵바트", profileImg: "banana", title: "빠빵빠빵빵빵", description: "뚜루뚜루뚜루뚤뚜루ㄸ루뚤뚜루", createdDate: "3분 전", likeCount: 3, commentCount: 1),
        BoardInfo(companyNm: "현대홈쇼핑", nickname: "까만썬그리", profileImg: "lemon", title: "호이호이호이호이호잏", description: "너무너무재밌었어요옹너무너무 재밌었어요옹너무", createdDate: "01.12. 14:23", likeCount: 2, commentCount: 2),
    ]
}


