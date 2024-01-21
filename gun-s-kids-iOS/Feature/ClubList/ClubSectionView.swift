//
//  ClubSectionView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/12/03.
//

import SwiftUI

struct ClubSectionView: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(Club.sample) { club in
                    NavigationLink(destination: ClubDetailMainView(title: club.clubNm)) {
                        ClubRow(clubInfo: club)
                    }.padding([.bottom], 5)
                }
            }
        }
    }
}

struct ClubItemView: View {
    let company: Company

    var body: some View {
        VStack {
            company.image
                .resizable()
                .clipShape(Circle())
                .frame(width: 90.0, height: 90.0)
            Text(company.name)
        }.padding([.horizontal], 5)
    }
}

struct ClubSectionView_Previews: PreviewProvider {
    static var previews: some View {
        ClubSectionView()
    }
}
