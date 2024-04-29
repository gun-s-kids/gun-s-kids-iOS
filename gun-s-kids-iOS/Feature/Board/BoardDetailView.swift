//
//  BoardDetailView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/02/24.
//

import SwiftUI
import URLImage
import URLImageStore

struct BoardDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var comment: String = ""
    let boardInfo: BoardInfo
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                ScrollView(.vertical) {
                    if boardInfo.postImg.count > 0 {
                        boardPostImagesStack
                    }
                    Spacer(minLength: 15)
                    boardPostContent
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        backButton
                    }
                }
//                TextField("", text: $comment,
//                          prompt: Text("댓글을 입력해주세요.").foregroundColor(Color.grayColor))
//                    .font(.system(size: 20))
//                    .foregroundColor(.black)
//                    .padding(.leading, 20)
            }
        }
         .navigationBarBackButtonHidden(true)
    }
}

extension BoardDetailView {
    var boardPostImagesStack: some View {
        LazyHStack {
            TabView {
                ForEach(boardInfo.postImg) { image in
                    URLImage(URL(string: image.url)!,
                             content: { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .padding(.horizontal, 0)
                    })
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: 250)
            .tabViewStyle(PageTabViewStyle())
        }
    }
    
    var boardPostContent: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Text(boardInfo.postTitle)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .padding([.top, .bottom], 3)
                Spacer()
            }
            
            HStack {
                Text(boardInfo.postContent)
                    .font(.system(size: 16))
                    .foregroundColor(Color.secondaryText)
                    .padding(.bottom, 10)
                Spacer()
            }
            
            HStack(alignment: .center, spacing: 20) {
                Button(action: {
                    print("좋아요")
                }) {
                    HStack {
                        Image("like")
                            .resizable()
                            .frame(width: 25, height: 25)
                        Text("좋아요")
                            .font(.system(size: 16))
                            .foregroundColor(.mainColor2)
                    }
                }
                Button(action: {
                    print("댓글쓰기")
                }) {
                    HStack {
                        Image("comment")
                            .resizable()
                            .frame(width: 25, height: 25)
                        Text("댓글쓰기")
                            .font(.system(size: 16))
                            .foregroundColor(.mainColor2)
                    }
                }
            }
        }
        .padding(.horizontal, 20)
    }
    
    var backButton: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct BoardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BoardDetailView(boardInfo: BoardInfo.sample[0])
    }
}
