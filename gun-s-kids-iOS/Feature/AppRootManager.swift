//
//  AppRootManager.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/03/18.
//

import Foundation

final class AppRootManager: ObservableObject {
    
    @Published var currentRoot: Roots = .authentication
    
    enum Roots {
        case authentication
        case home
    }
}
