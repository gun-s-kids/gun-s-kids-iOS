//
//  BoardListView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/01/13.
//

import SwiftUI

struct BoardListView: View {
    @State var isButtonPressed: Bool = false

    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ScrollView(.vertical) {
                    LazyVStack(alignment: .leading) {
                        ForEach(BoardInfo.sample) { board in
                            if board.postImg.count > 0 {
                                NavigationLink(destination: BoardDetailView(boardInfo: board)) {
                                    BoardImageRow(boardInfo: board)
                                }
                            } else {
                                NavigationLink(destination: BoardDetailView(boardInfo: board)) {
                                    BoardRow(boardInfo: board)
                                }
                            }
                        }
                    }
                }
                NavigationLink(destination: WriteBoardView(), isActive: $isButtonPressed) {
                    addBoardButton
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 20))
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    navigationBarButtonStack
                }
            }
        }
    }
}

extension BoardListView {
    var addBoardButton: some View {
        Button(action: {
            isButtonPressed = true
        }) {
            HStack {
                Image(systemName: "pencil")
                Text("글쓰기")
                    .font(.title3)
            }
        }
        .padding()
        .background(Color.mainColor4)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    
    var navigationBarButtonStack: some View {
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
        }
    }
}

struct BoardListView_Previews: PreviewProvider {
    static var previews: some View {
        BoardListView()
    }
}
