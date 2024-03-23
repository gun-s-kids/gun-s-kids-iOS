//
//  SetNicknameView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/12/16.
//

import SwiftUI

struct SetNicknameView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: SignUpViewModel
    @State var nickname = ""
    @State private var isValid = true
    @State var isButtonPressed: Bool = false
    @Binding var path: Bool

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(alignment: .center, spacing: 15) {
                    Spacer()
                        .frame(height: 50)
                    AuthExplainTextVStack(title: "회원가입", subtitle: "활동명으로 사용할 닉네임을 입력해주세요!")
                    Spacer()
                        .frame(height: 15)
                    NicknameTextField(nickname: $nickname, isValid: $isValid)
                    Text("이미 사용중인 별명입니다.")
                        .foregroundColor(isValid ? .clear : .red)
                    nextButton
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
    }
}

extension SetNicknameView {
    var nextButton: some View {
        NavigationLink(destination: ConfirmSignUpView(path: $path), isActive: $isButtonPressed) {
            Button(action: {
                viewModel.validateNickname(nickname: nickname)
                isButtonPressed = true
                },
                   label: {
                    Text("다음")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 57)
                        .frame(maxWidth: 305)
                        .background(Color.mainColor3)
                        .cornerRadius(10)
                    })
                .buttonStyle(PressableButtonStyle())
        }
    }
    
    var backButton: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.black)
        }
    }
}

struct NicknameTextField: View {
    @Binding var nickname: String
    @Binding var isValid: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("닉네임")
                .foregroundColor(.secondary)
            TextField("", text: $nickname)
                           .frame(height: 50)
                           .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                           .cornerRadius(10)
                           .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(isValid ? Color.dcdcdc : Color.red, lineWidth: 1))
        }
    }
}

struct SetNicknameView_Previews: PreviewProvider {
    static var previews: some View {
        SetNicknameView(viewModel: SignUpViewModel(), path: .constant(false))
    }
}


