//
//  MyClubRow.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/11/05.
//

import SwiftUI
import URLImage

struct ClubRow: View {
    let clubInfo: Datum

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
            
            Text("Since " + "2022. 08. 08")
                .font(.body)
                .foregroundColor(Color.secondaryText)
                .padding(.bottom, 6)
            
            HStack(spacing: 0) {
                Text("현대백화점")
                    .foregroundColor(.black)
                Text(" | ")
                    .foregroundColor(.black)
                Text("멤버 10")
                    .foregroundColor(.black)
            }
        }
        .padding([.leading, .bottom], 12)
        .padding([.top, .trailing])
    }
}

struct ClubRow_Previews: PreviewProvider {
    static var previews: some View {
        ClubRow(clubInfo: Datum(clubNo: 1, companyNo: 1, clubNm: "클라이밍 동호회", clubImg: "https://storage.googleapis.com/gunskid/adf55b4e-767f-4cc0-90b5-5b4ccbe8886f"))
    }
}
