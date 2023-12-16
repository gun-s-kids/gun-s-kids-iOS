//
//  MyClub.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/11/05.
//

import SwiftUI

struct Club: Identifiable {
    var id = UUID()
    let title: String
    let imageName: String
    let foundationDate: String
    let members: Int
    let company: String

    static let sample: [Club] = [
        Club(title: "[논알콜] 소.취.생 (소소한 취미 생활)", imageName: "fig", foundationDate: "2022. 08. 08", members: 32, company: "한섬"),
        Club(title: "마운틴 크루 (등산 & 러닝 & 여행)", imageName: "avocado", foundationDate: "2022. 08. 08", members: 48, company: "현대 IT&E"),
        Club(title: "[보드게임] On Board", imageName: "banana", foundationDate: "2022. 08. 08", members: 14, company: "현대홈쇼핑"),
        Club(title: "원엔터컴퍼니", imageName: "pomegranate", foundationDate: "2010. 12. 02", members: 24, company: "현대백화점")
    ]
}


