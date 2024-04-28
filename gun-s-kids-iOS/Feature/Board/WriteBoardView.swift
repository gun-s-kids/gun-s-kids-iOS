//
//  WriteBoardView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/02/25.
//

import SwiftUI

struct WriteBoardView: View {
    @ObservedObject var viewModel: BoardListViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var showImagePicker = false
    @State var title: String = ""
    @State var content: String = ""
    @State var placeholderText: String = "내용을 입력해주세요."
    @State var selectedImage: UIImage?
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 15) {
                        Spacer(minLength: 15)
                        postTitleTextField
                        postContentTextEditor
                    }
                    postImageView
                }
                addImageButton
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 20))
            }
            .padding(.horizontal, 20)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    backButton
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    enrollButton
                }
            }
        }
        .onChange(of: viewModel.isPostSuccess) { value in
            if value {
                self.viewModel.writingPostImages = []
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

extension WriteBoardView {
    var backButton: some View {
        Button {
            self.viewModel.writingPostImages = []
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .aspectRatio(contentMode: .fit)
                .tint(.black)
        }
    }
    
    var enrollButton: some View {
        Button {
            self.viewModel.saveClubPost(clubNo: viewModel.clubNo ?? 1, companyNo: 1, postTitle: title, postContent: content)
        } label: {
            Image(systemName: "plus")
                .aspectRatio(contentMode: .fit)
                .tint(.black)
        }
    }
    
    var addImageButton: some View {
        Button(action: {
            showImagePicker.toggle()
        }) {
            HStack {
                Image(systemName: "photo.fill")
                Text("사진첩")
                    .font(.title3)
            }
        }
        .padding()
        .background(Color.mainColor4)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .sheet(isPresented: $showImagePicker, onDismiss: {
            guard let selectedImage = selectedImage else { return }
            viewModel.loadImages(uiImage: selectedImage)
        }) {
            ImagePicker(image: $selectedImage)
        }
    }
    
    var postImageView: some View {
        LazyVStack(alignment: .center) {
            ForEach(viewModel.writingPostImages) { imageCell in
                imageCell.image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 180, height: 180)
                    .clipped()
                    .overlay(Button(action: {
                        viewModel.removeImage(imageCell)
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.white)
                            .padding(5)
                    }, alignment: .topTrailing)
            }
        }
    }
    
    var postTitleTextField: some View {
        TextField("", text: $title,
                  prompt: Text("제목을 입력해주세요.").foregroundColor(Color.grayColor))
            .font(.system(size: 24, weight: .semibold))
            .foregroundColor(.black)
            .padding(.leading, 3)
    }
    
    var postContentTextEditor: some View {
        ZStack(alignment: .topLeading) {
            if self.content.isEmpty {
                TextEditor(text: $placeholderText)
                    .frame(height: 300)
                    .font(.system(size: 20))
                    .foregroundColor(Color.grayColor)
                    .disabled(true)
            }
            TextEditor(text: $content)
                .frame(height: 300)
                .font(.system(size: 20))
                .foregroundColor(.black)
                .opacity(self.content.isEmpty ? 0.25 : 1)
        }
    }
}

struct WriteBoardView_Previews: PreviewProvider {
    static var previews: some View {
        WriteBoardView(viewModel: BoardListViewModel(clubNo: 1))
    }
}
