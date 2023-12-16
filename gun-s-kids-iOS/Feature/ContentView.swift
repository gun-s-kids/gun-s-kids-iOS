//
//  ContentView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/09/10.
//

import SwiftUI

struct ContentView: View {
    @State var isLogin = false
    
    var body: some View {
        if isLogin {
            MainView()
        } else {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
