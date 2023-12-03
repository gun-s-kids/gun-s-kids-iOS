//
//  MyClubView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/11/05.
//

import SwiftUI

struct MyClubView: View {
    
    var body: some View {
        NavigationView {
            List(Club.sample) { club in
                NavigationLink(destination: ClubDetailMainView(title: club.title), label: { ClubRow(clubInfo: club) })
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("My Club !")
        }
    }
}

struct MyClubView_Previews: PreviewProvider {
    static var previews: some View {
        MyClubView()
    }
}
