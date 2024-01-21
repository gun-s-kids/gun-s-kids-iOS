//
//  MyClubRow.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/11/05.
//

import SwiftUI
import URLImage

struct ClubRow: View {
    let clubInfo: Club

    var body: some View {
        HStack(alignment: .center) {
            productImage
            productDescription
                .frame(width: 200)
        }
        .frame(width: 350, height: 150)
        .background(Color.primary.colorInvert())
        .cornerRadius(6)
        .shadow(color: Color.primaryShadow, radius: 1, x:2, y:2)
    }
}

extension ClubRow {
    var productImage: some View {
        URLImage(URL(string: clubInfo.clubImg)!,
                 content: { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()

        })
    }

    var productDescription: some View {
        VStack(alignment: .leading){
            Text(clubInfo.clubNm)
                .font(.system(size: 16))
                .fontWeight(.medium)
                .foregroundColor(.black)
                .padding([.top, .bottom], 6)
            
            Text("Since " + String(clubInfo.createdDate.prefix(10)))
                .font(.body)
                .foregroundColor(Color.secondaryText)
                .padding(.bottom, 6)
            
            HStack(spacing: 0) {
                Text(clubInfo.companyNm)
                    .foregroundColor(.black)
                Text(" | ")
                    .foregroundColor(.black)
                Text("멤버 \(clubInfo.memberCount)")
                    .foregroundColor(.black)
            }
        }
        .padding([.leading, .bottom], 12)
        .padding([.top, .trailing])
    }
}

struct ClubRow_Previews: PreviewProvider {
    static var previews: some View {
        ClubRow(clubInfo: Club(clubNo: 1, companyNm: "현대홈쇼핑", clubNm: "꽃꽂이 동호회", clubImg: "https://storage.googleapis.com/gunskid/3a51f6ae-233e-47aa-b90e-29cba7c8d384", memberCount: 10, createdDate: "2024-01-21T07:20:25.824219"))
    }
}
