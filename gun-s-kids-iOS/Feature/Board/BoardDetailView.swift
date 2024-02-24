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
    let boardInfo: BoardInfo
    
    var body: some View {
        ScrollView(.vertical) {
            if boardInfo.postImg.count > 0 {
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
            Spacer(minLength: 15)
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
            }
            .padding(.horizontal, 20)
        }
    }
}

struct BoardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BoardDetailView(boardInfo: BoardInfo.sample[0])
    }
}
