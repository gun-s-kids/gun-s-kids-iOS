//
//  BoardListView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/01/13.
//

import SwiftUI

struct BoardListView: View {
    let clubNo: Int
    @StateObject var viewModel: BoardListViewModel
    @State var isButtonPressed: Bool = false
    
    init(clubNo: Int){
        self.clubNo = clubNo
        self._viewModel = StateObject.init(wrappedValue: BoardListViewModel(clubNo: clubNo))
    }

    var body: some View {
            ZStack(alignment: .bottomTrailing) {
                ScrollView(.vertical) {
                    LazyVStack(alignment: .leading) {
                        ForEach(viewModel.boardInfoList) { board in
                            if board.postImg.count > 0 {
                                Button(action: {
                                    viewModel.fetchClubPostDetail(postNo: board.postNo)
                                }) {
                                    BoardImageRow(boardInfo: board)
                                }
                            } else {
                                Button(action: {
                                    viewModel.fetchClubPostDetail(postNo: board.postNo)
                                }) {
                                    BoardRow(boardInfo: board)
                                }
                            }
                        }
                    }
                }
                NavigationLink(destination: WriteBoardView(viewModel: viewModel), isActive: $isButtonPressed) {
                    addBoardButton
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 20))
                }
                NavigationLink(destination: BoardDetailView(viewModel: viewModel), isActive: $viewModel.isFetchedData) {
                    EmptyView()
                }
                .hidden()
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
        BoardListView(clubNo: 1)
    }
}
