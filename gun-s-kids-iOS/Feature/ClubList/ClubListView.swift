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
            }.navigationTitle("동호회 찾기")
        }
    }
}

struct ClubListView_Previews: PreviewProvider {
    static var previews: some View {
        ClubListView()
    }
}
