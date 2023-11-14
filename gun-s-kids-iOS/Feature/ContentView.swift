//
//  ContentView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/09/10.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .list

    enum Tab {
        case list
        case myClub
        case profile
    }

    var body: some View {
        TabView(selection: $selection) {
            Color.white
                .edgesIgnoringSafeArea(.all)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(Tab.list)
            MyClubView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                }
                .edgesIgnoringSafeArea(.all)
                .tag(Tab.myClub)
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                }
                .tag(Tab.profile)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
