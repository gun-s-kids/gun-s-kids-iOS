//
//  ClubPostResponse.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/03/03.
//

import Foundation

struct ClubPostListResponse: Codable {
    let status: String
    let code: Int
    let data: [BoardInfo]
}

struct BoardInfo: Codable, Identifiable {
    let id = UUID()
    let postNo: Int
    let nickname: String
    let companyNm: String
    let postTitle: String
    let postContent: String
    let createdDate: String
    let likeCnt: Int
    let commentCount: Int
    let postImg: [PostImage]
    
    private enum CodingKeys: String, CodingKey {
        case postNo
        case nickname
        case companyNm
        case postTitle
        case postContent
        case createdDate
        case likeCnt
        case commentCount
        case postImg
    }
    
    static let sample: [BoardInfo] = [
        BoardInfo(postNo: 1, nickname: "볼빵빵짱구", companyNm: "한섬", postTitle: "23.09.04 정모 후기!!", postContent: "너무너무재밌었어요옹너무너무재밌었어요옹너무너무너무너무너무넌무너무무너무너뭐뭐무머눠눤", createdDate: "방금 전", likeCnt: 4, commentCount: 3, postImg: [PostImage(postImgNo: 1, postNo: 1, url: "https://placebear.com/g/200/200"), PostImage(postImgNo: 2, postNo: 1, url: "https://placebear.com/g/200/200")]),
        BoardInfo(postNo: 2, nickname: "볼빵빵바트", companyNm: "현대 IT&E", postTitle: "치이카와 너무 귀엽지 않아??", postContent: "치아카와 너무 귀여워><", createdDate: "3분 전", likeCnt: 3, commentCount: 1, postImg: []),
        BoardInfo(postNo: 3, nickname: "까만썬그리", companyNm: "현대홈쇼핑", postTitle: "23.09.11 정모 후기~!", postContent: "재밌었어요옹너무너무너무너무너무넌무너무무너무너뭐뭐무머눠눤", createdDate: "01.12. 14:23", likeCnt: 2, commentCount: 2, postImg: []),
        BoardInfo(postNo: 4, nickname: "볼빵빵바트", companyNm: "현대백화점 면세점", postTitle: "빠빵빠빵빵빵", postContent: "뚜루뚜루뚜루뚤뚜루ㄸ루뚤뚜루", createdDate: "5분 전", likeCnt: 2, commentCount: 3, postImg: [PostImage(postImgNo: 3, postNo: 1, url: "https://placebear.com/g/200/200")]),
        BoardInfo(postNo: 5, nickname: "까만썬그리", companyNm: "현대홈쇼핑", postTitle: "호이호이호이호이호잏", postContent: "너무너무재밌었어요옹너무너무 재밌었어요", createdDate: "01.12. 14:23", likeCnt: 0, commentCount: 3, postImg: []),
    ]
}

struct PostImage: Codable, Identifiable {
    let id = UUID()
    let postImgNo: Int
    let postNo: Int
    let url: String
    
    private enum CodingKeys: String, CodingKey {
        case postImgNo
        case postNo
        case url
    }
}

struct PostComment: Codable, Identifiable {
    let id = UUID()
    let commentNo: Int
    let commentContent: String
    let nickname: String
    let createdDate: String
    
    private enum CodingKeys: String, CodingKey {
        case commentNo
        case commentContent
        case nickname
        case createdDate
    }
}
