//
//  ClubListView.swift
//  gun-s-kids-iOS
//
//  Created by Hhome on 2023/11/6.
//

import SwiftUI

struct ClubListView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                Spacer(minLength: 30)
                CompanySectionView()
                Spacer(minLength: 30)
                ClubSectionView()
                Spacer(minLength: 10)
            }.toolbar {
                Button {} label: {
                        Image("magnifyglass")
                        .resizable()
                        .frame(width: 30, height: 30)
                    }
                Button {} label: {
                        Image("myclub")
                        .resizable()
                        .frame(width: 30, height: 30)
                    }
                Button {} label: {
                        Image("gear")
                        .resizable()
                        .frame(width: 30, height: 30)
                    }
            }
        }
    }
}

struct ClubListView_Previews: PreviewProvider {
    static var previews: some View {
        ClubListView()
    }
}
