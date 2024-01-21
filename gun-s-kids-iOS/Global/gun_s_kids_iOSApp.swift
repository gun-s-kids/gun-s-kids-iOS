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
    var body: some Scene {
        let urlImageService = URLImageService(fileStore: URLImageFileStore(),
                                              inMemoryStore: URLImageInMemoryStore())

        return WindowGroup {
            MainView()
                .environment(\.urlImageService, urlImageService)
        }
    }
}
