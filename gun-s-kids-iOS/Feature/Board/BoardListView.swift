//
//  BoardListView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/01/13.
//

import SwiftUI

struct BoardListView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                LazyVStack(alignment: .leading) {
                    ForEach(BoardInfo.sample) { board in
                        if board.postImg.count > 0 {
                            BoardImageRow(boardInfo: board)
                        } else {
                            BoardRow(boardInfo: board)
                        }
                    }
                }
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        NavigationLink(destination: ProfileView()) {
                            Image("magnifyglass")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                        NavigationLink(destination: ProfileView()) {
                            Image("myclub")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                        NavigationLink(destination: ProfileView()) {
                            Image("gear")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                    }
                }
            }
        }
    }
}

struct BoardListView_Previews: PreviewProvider {
    static var previews: some View {
        BoardListView()
    }
}
