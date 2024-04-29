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
    @ObservedObject var viewModel: BoardListViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var comment: String = ""
    @State var isClicked: Bool = false
    @State var showingAlert: Bool = false
    @FocusState var isCommenting: Bool
        
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                ScrollView(.vertical) {
                    if viewModel.boardDetailInfo.postImg.count > 0 {
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
                .onTapGesture {
                    hideKeyboard()
                }
                textFieldView
                    .background(.ultraThinMaterial)
            }
        }
         .navigationBarBackButtonHidden(true)
         .onAppear {
             isClicked = viewModel.boardDetailInfo.isLike
         }
    }
}

extension BoardDetailView {
    var boardPostImagesStack: some View {
        LazyHStack {
            TabView {
                ForEach(viewModel.boardDetailInfo.postImg) { image in
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
                Text(viewModel.boardDetailInfo.postTitle)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .padding([.top, .bottom], 3)
                Spacer()
            }
            
            HStack {
                Text(viewModel.boardDetailInfo.postContent)
                    .font(.system(size: 16))
                    .foregroundColor(Color.secondaryText)
                    .padding(.bottom, 10)
                Spacer()
            }
            
            HStack(alignment: .center, spacing: 20) {
                Button(action: {
                    showingAlert = true
                }) {
                    HStack {
                        if isClicked {
                            Image("like_clicked")
                                .resizable()
                                .frame(width: 25, height: 25)
                            Text("좋아요")
                                .font(.system(size: 16))
                                .foregroundColor(.mainColor4)
                        } else {
                            Image("like")
                                .resizable()
                                .frame(width: 25, height: 25)
                            Text("좋아요")
                                .font(.system(size: 16))
                                .foregroundColor(.mainColor2)
                        }
                    }
                }.alert(isClicked ? "취소 하시겠습니까?" : "좋아요 하시겠습니까?", isPresented: $showingAlert) {
                    Button("확인", role: .cancel) {
                        showingAlert = false
                        isClicked.toggle()
                        viewModel.postLike(postNo: viewModel.boardDetailInfo.postNo)
                    }
                    Button("취소", role: .destructive) {
                        showingAlert = false
                    }
                }
                
                Button(action: {
                    isCommenting.toggle()
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
    
    var textFieldView: some View {
        HStack(spacing: 10) {
            TextField("", text: $comment,
                      prompt: Text("댓글을 입력해주세요.").foregroundColor(Color.grayColor))
                .focused($isCommenting)
                .font(.system(size: 20))
                .foregroundColor(.black)
                .frame(height: 50)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                .padding(.leading, 10)
                .submitLabel(.done)
                .onSubmit {
                    print(comment)
                }
            
            Button {
                print(comment)
            } label: {
                Image(systemName: "paperplane")
                    .aspectRatio(contentMode: .fit)
            }
            .padding(.trailing, 20)
        }
    }
}

struct BoardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BoardDetailView(viewModel: BoardListViewModel(clubNo: 1))
    }
}
