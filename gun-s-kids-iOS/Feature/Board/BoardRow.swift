//
//  BoardRow.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/01/13.
//

import SwiftUI

struct BoardRow: View {
    var body: some View {
        VStack(alignment: .leading) {
            profileStack
            boardInfo
            likeAndCommentStack
        }
        .frame(width: .infinity, height: 200)
    }
}

extension BoardRow {
    var profileStack: some View {
        HStack(alignment: .center, spacing: 10) {
            Image("banana")
                .resizable()
                .scaledToFill()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 3) {
                Text("3분 전")
                    .foregroundColor(.black)
                    .font(.system(size: 11))
                Text("방금 전 현대 IT&E • 볼빵빵짱구")
                    .foregroundColor(.black)
                    .font(.system(size: 11))
            }
        }
    }
    
    var boardInfo: some View {
        VStack(alignment: .leading) {
            Text("23.09.04 정모 후기!!")
                .font(.system(size: 20))
                .fontWeight(.medium)
                .foregroundColor(.black)
                .padding([.top, .bottom], 3)
            
            Text("너무너무재밌었어요옹너무너무 재밌었어요옹너무")
                .font(.system(size: 16))
                .foregroundColor(Color.secondaryText)
                .lineLimit(2)
                .padding(.bottom, 6)
        }
    }
    
    var likeAndCommentStack: some View {
        HStack(alignment: .center, spacing: 8) {
            Image("like")
                .resizable()
                .frame(width: 25, height: 25)
            Text("5")
                .font(.system(size: 16))
                .foregroundColor(Color.secondaryText)
            Image("comment")
                .resizable()
                .frame(width: 25, height: 25)
            Text("5")
                .font(.system(size: 16))
                .foregroundColor(Color.secondaryText)
        }
    }
}

struct BoardRow_Previews: PreviewProvider {
    static var previews: some View {
        BoardRow()
    }
}
