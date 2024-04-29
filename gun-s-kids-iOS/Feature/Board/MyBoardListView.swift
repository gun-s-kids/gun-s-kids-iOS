//
//  MyBoardListView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/04/26.
//

import SwiftUI

struct MyBoardListView: View {
    @StateObject var viewModel: MyBoardListViewModel
    @State var isButtonPressed: Bool = false
    
    init(){
        self._viewModel = StateObject.init(wrappedValue: MyBoardListViewModel())
    }

    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                LazyVStack(alignment: .leading) {
                    ForEach(viewModel.boardInfoList) { board in
                        if board.postImg.count > 0 {
                            NavigationLink(destination: BoardDetailView(boardInfo: viewModel.boardDetailInfo ?? viewModel.setDefaultBoardDetailInfo(board)), isActive: $viewModel.isFetchedData) {
                                BoardImageRow(boardInfo: board)
                                    .onTapGesture {
                                        print("tab")
                                    }
                            }
                        } else {
                            NavigationLink(destination: BoardDetailView(boardInfo: viewModel.boardDetailInfo ?? viewModel.setDefaultBoardDetailInfo(board)), isActive: $viewModel.isFetchedData) {
                                BoardRow(boardInfo: board)
                                    .onTapGesture {
                                        print("tab")
                                    }
                            }
                        }
                    }
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

extension MyBoardListView {
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

struct MyBoardListView_Previews: PreviewProvider {
    static var previews: some View {
        MyBoardListView()
    }
}

