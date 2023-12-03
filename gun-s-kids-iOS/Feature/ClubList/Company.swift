//
//  Company.swift
//  gun-s-kids-iOS
//
//  Created by Hhome on 2023/11/14.
//

import SwiftUI

struct Company: Identifiable {
    let id = UUID()
    let image: Image
    let name: String

    static let sample: [Company] = [
        Company(image: Image("pineapple"), name: "현대 IT&E"),
        Company(image: Image("cherry"), name: "한섬"),
        Company(image: Image("blueberry"), name: "현대백화점 면세점"),
        Company(image: Image("lemon"), name: "현대홈쇼핑"),
        Company(image: Image("strawberry"), name: "현대백화점")
    ]
}
