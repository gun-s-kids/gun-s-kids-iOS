//
//  ColorExtension.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/10/09.
//

import SwiftUI
 
extension Color {
    
    static let dcdcdc = Color(hex: "dcdcdc")
    static let primaryShadow = Color.primary.opacity(0.2)
    static let secondaryText = Color(hex: "#6e6e6e")
    static let grayColor = Color(hex: "888888")
    static let background = Color(UIColor.systemGray6)
    static let mainColor1 = Color(hex: "F3EEEA")
    static let mainColor2 = Color(hex: "EBE3D5")
    static let mainColor3 = Color(hex: "B0A695")
    static let mainColor4 = Color(hex: "776B5D")
    
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
