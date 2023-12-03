//
//  MyClubRow.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/11/05.
//

import SwiftUI

struct ClubRow: View {
    let clubInfo: Club

    var body: some View {
        HStack(alignment: .center) {
            productImage
            productDescription
        }
        .frame(width: 350, height: 150)
        .background(Color.primary.colorInvert())
        .cornerRadius(6)
        .shadow(color: Color.primaryShadow, radius: 1, x:2, y:2)
    }
}

extension ClubRow {
    var productImage: some View {
        Image(clubInfo.imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100)
            .clipped()
    }

    var productDescription: some View {
        VStack(alignment: .leading){
            Text(clubInfo.title)
                .font(.headline)
                .fontWeight(.medium)
                .padding([.top, .bottom], 6)
            
            Text("Since " + clubInfo.foundationDate)
                .font(.body)
                .foregroundColor(Color.secondaryText)
                .padding(.bottom, 6)
            
            HStack(spacing: 0) {
                Text(clubInfo.company)
                Text(" | ")
                Text("멤버 \(clubInfo.members)")
            }
        }
        .padding([.leading, .bottom], 12)
        .padding([.top, .trailing])
    }
}

struct ClubRow_Previews: PreviewProvider {
    static var previews: some View {
        ClubRow(clubInfo: Club(title: "[논알콜] 소.취.생 (소소한 취미 생활)", imageName: "fig", foundationDate: "2022. 08. 08", members: 32, company: "한섬"))
    }
}
