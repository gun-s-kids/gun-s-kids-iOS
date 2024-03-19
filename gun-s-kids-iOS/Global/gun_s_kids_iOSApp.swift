//
//  gun_s_kids_iOSApp.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/09/10.
//

import SwiftUI
import URLImage
import URLImageStore

@main
struct gun_s_kids_iOSApp: App {
    @StateObject var appRootManager = AppRootManager()
    let urlImageService = URLImageService(fileStore: URLImageFileStore(),
                                          inMemoryStore: URLImageInMemoryStore())
    
    var body: some Scene {
        WindowGroup {
            Group {
                switch appRootManager.currentRoot {
                case .authentication:
                    LoginView()
                    
                case .home:
                    MainView()
                }
            }
            .environment(\.urlImageService, urlImageService)
            .environmentObject(appRootManager)
        }
    }
}
