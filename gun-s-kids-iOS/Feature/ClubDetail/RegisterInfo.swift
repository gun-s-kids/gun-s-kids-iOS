//
//  RegisterInfo.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/03/03.
//

import Foundation

struct RegisterInfo: Codable, Identifiable {
    let id = UUID()
    let clubNo: Int
    let companyNm: String
    let clubNm: String
    let profileImg: String
    let message: String
    let nickname: String
    
    private enum CodingKeys: String, CodingKey {
        case clubNo
        case companyNm
        case clubNm
        case profileImg
        case message
        case nickname
    }
    
    static let sample: [RegisterInfo] = [
        RegisterInfo(clubNo: 1, companyNm: "현대홈쇼핑", clubNm: "꽃꽂이 동호회", profileImg: "https://placebear.com/g/200/200", message: "가입 신청합니다!!!!", nickname: "아이디 123"),
        RegisterInfo(clubNo: 1, companyNm: "현대 IT&E", clubNm: "꽃꽂이 동호회", profileImg: "https://placebear.com/g/200/200", message: "가입 신청합니당",
                     nickname: "아이디 321"),
        RegisterInfo(clubNo: 1, companyNm: "현대백화점", clubNm: "꽃꽂이 동호회", profileImg: "https://placebear.com/g/200/200", message: "가입 신청합니다!!!! 잘부탁드립니다~", nickname: "볼빵빵한")
    ]
}


