//
//  BoardCommentRow.swift
//  gun-s-kids-iOS
//
//  Created by Hhome on 2024/4/30.
//

import SwiftUI

struct BoardCommentRow: View {
    var commentInfo: PostComment
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .center) {
                Text(commentInfo.nickname)
                    .foregroundColor(.black)
                    .font(.system(size: 16))
                Spacer()
                Text(commentInfo.createdDate.prefix(10))
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
            }
            Text(commentInfo.commentContent)
                .foregroundColor(.black)
                .font(.system(size: 20))
        }
        .padding([.horizontal], 20)
        .frame(width: UIScreen.main.bounds.width - 50, height: 100)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.primaryShadow, lineWidth: 1)
                .shadow(color: Color.primaryShadow, radius: 10, x:4, y:4)
        )
    }
}

extension BoardCommentRow {
    
}

struct BoardCommentRow_Previews: PreviewProvider {
    static var previews: some View {
        BoardCommentRow(commentInfo: PostComment(commentNo: 1, commentContent: "skdjflakjdlfkjsldkf", nickname: "TEST", createdDate: "2024-04-26T07:16:12.341738"))
    }
}
