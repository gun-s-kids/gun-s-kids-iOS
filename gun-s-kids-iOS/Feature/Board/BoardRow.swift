//
//  BoardRow.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/01/13.
//

import SwiftUI

struct BoardRow: View {
    let boardInfo: BoardInfo
    
    var body: some View {
        VStack(alignment: .leading) {
            profileStack
            boardDetailInfo
            likeAndCommentStack
            Divider()
        }
        .padding([.horizontal], 20)
        .frame(width: UIScreen.main.bounds.width, height: 160)
    }
}

extension BoardRow {
    var profileStack: some View {
        HStack(alignment: .center, spacing: 10) {
            Image("fig")
                .resizable()
                .scaledToFill()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 3) {
                Text(boardInfo.createdDate)
                    .foregroundColor(.black)
                    .font(.system(size: 11))
                Text("\(boardInfo.companyNm) • \(boardInfo.nickname)")
                    .foregroundColor(.black)
                    .font(.system(size: 11))
            }
        }
    }
    
    var boardDetailInfo: some View {
        VStack(alignment: .leading) {
            Text(boardInfo.postTitle)
                .font(.system(size: 20))
                .fontWeight(.medium)
                .foregroundColor(.black)
                .padding([.top, .bottom], 3)
            
            Text(boardInfo.postContent)
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
            Text("\(boardInfo.likeCnt)")
                .font(.system(size: 16))
                .foregroundColor(Color.secondaryText)
            Image("comment")
                .resizable()
                .frame(width: 25, height: 25)
            Text("\(boardInfo.commentCount)")
                .font(.system(size: 16))
                .foregroundColor(Color.secondaryText)
        }
    }
}

struct BoardRow_Previews: PreviewProvider {
    static var previews: some View {
        BoardRow(boardInfo: BoardInfo.sample[0])
    }
}
