//
//  MakeClubView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/03/03.
//

import SwiftUI

struct MakeClubView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: ClubListViewModel
    @State var clubName: String = ""
    @State var content: String = ""
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var clubImage: Image?
    @State var showingAlert = false
    
    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        clubImage = Image(uiImage: selectedImage)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center) {
                    profileImage
                    Spacer(minLength: 30)
                    clubNameTextField
                    Spacer(minLength: 15)
                    clubIntroduce
                    Spacer(minLength: 30)
                    registerButton
                }
                .padding()
                .edgesIgnoringSafeArea(.all)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    backButton
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .onChange(of: viewModel.registerClubSuccess) { value in
            if value {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        .alert(isPresented: $viewModel.registerClubFailure) {
            Alert(title: Text("등록 실패"), message: Text(viewModel.registerClubFailureMessage), dismissButton: .default(Text("Dismiss")))
        }
    }
}

extension MakeClubView {
    var backButton: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.black)
        }
    }
    
    var profileImage: some View {
        Button {
            showImagePicker.toggle()
        } label: {
            if let clubImage = clubImage {
                clubImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 180, height: 180)
                    .clipped()
            } else {
                Image("myclub")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                    .clipped()
            }
        }
        .sheet(isPresented: $showImagePicker, onDismiss: {
            loadImage()
        }) {
            ImagePicker(image: $selectedUIImage)
        }
    }
    
    var clubNameTextField: some View {
        VStack(alignment: .leading) {
            Text("동아리 이름")
                .foregroundColor(.gray)
                .font(.system(size: 15))
            TextField("", text: $clubName)
                           .frame(height: 50)
                           .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                           .cornerRadius(10)
                           .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.dcdcdc, lineWidth: 1))
        }
        .padding([.horizontal], 15)
    }
    
    var clubIntroduce: some View {
        VStack(alignment: .leading) {
            Text("동아리 소개")
                .foregroundColor(.gray)
                .font(.system(size: 15))
            TextEditor(text: $content)
                .font(.body)
                .frame(height: 188)
                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.dcdcdc, lineWidth: 1))
        }
        .padding([.horizontal], 15)
    }
    
    var registerButton: some View {
        Button(action: {
            if let selectedUIImage {
                viewModel.registerClub(companyNo: 1, clubNm: clubName, clubDesc: content, clubImg: selectedUIImage)
                print("clubName: \(clubName)")
                print("clubDesc: \(content)")
            } else {
                showingAlert = true
            }
        }, label: {
            Text("등록하기")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 57)
                .frame(maxWidth: 231)
                .background(Color.mainColor3)
                .cornerRadius(10)
        })
        .buttonStyle(PressableButtonStyle())
        .alert("이미지를 등록해주세요", isPresented: $showingAlert) {
            Button("확인", role: .cancel) {
                showingAlert = false
            }
        }
    }
}
struct MakeClubView_Previews: PreviewProvider {
    static var previews: some View {
        MakeClubView(viewModel: ClubListViewModel())
    }
}
