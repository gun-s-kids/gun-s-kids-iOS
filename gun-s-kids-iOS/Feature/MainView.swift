//
//  MainView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/12/16.
//

import SwiftUI

struct MainView: View {
    @State private var selection: Tab = .list

    enum Tab {
        case list
        case myClub
        case profile
    }

    var body: some View {
        TabView(selection: $selection) {
            ClubListView()
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
