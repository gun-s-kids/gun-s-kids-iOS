//
//  MyClub.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/11/05.
//

import SwiftUI

struct Club: Identifiable {
    var id = UUID()
    let clubNm: String
    let clubImg: String
    let foundationDate: String
    let members: Int
    let company: String

    static let sample: [Club] = [
        Club(clubNm: "[논알콜] 소.취.생 (소소한 취미 생활)", clubImg: "fig", foundationDate: "2022. 08. 08", members: 32, company: "한섬"),
        Club(clubNm: "마운틴 크루 (등산 & 러닝 & 여행)", clubImg: "avocado", foundationDate: "2022. 08. 08", members: 48, company: "현대 IT&E"),
        Club(clubNm: "[보드게임] On Board", clubImg: "banana", foundationDate: "2022. 08. 08", members: 14, company: "현대홈쇼핑"),
        Club(clubNm: "원엔터컴퍼니", clubImg: "pomegranate", foundationDate: "2010. 12. 02", members: 24, company: "현대백화점")
    ]
}


