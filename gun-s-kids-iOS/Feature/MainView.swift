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
        case board
        case calendar
    }

    var body: some View {
        TabView(selection: $selection) {
            ClubListView()
                .tabItem {
                    selection == .list ?
                    Image("home_clicked") :
                    Image("home")
                }
                .tag(Tab.list)
                
            BoardListView()
                .tabItem {
                    selection == .board ?
                    Image("board_clicked") :
                    Image("board")
                }
                .edgesIgnoringSafeArea(.all)
                .tag(Tab.board)

            ProfileView()
                .tabItem {
                    selection == .calendar ?
                    Image("gear_clicked") :
                    Image("gear")
                }
                .tag(Tab.calendar)
        }
        .accentColor(Color.mainColor4)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
