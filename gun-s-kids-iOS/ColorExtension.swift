//
//  ColorExtension.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/10/02.
//

import SwiftUI
 
extension Color {
    static let dcdcdc = Color(hex: "#dcdcdc")
    
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
