//
//  SetPasswordView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/09/16.
//

import SwiftUI

struct SetPasswordView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: SignUpViewModel
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isValid = true
    @State private var isButtonPressed = false

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(alignment: .center, spacing: 15) {
                    Spacer()
                        .frame(height: 50)
                    AuthExplainTextVStack(title: "회원가입", subtitle: "비밀번호를 입력하세요!")
                    Spacer()
                        .frame(height: 15)
                    PasswordTextFieldVStack(password: password, confirmPassword: confirmPassword, isValid: isValid)
                    Text("비밀번호가 일치하지 않습니다.")
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

extension SetPasswordView {
    var nextButton: some View {
        NavigationLink(destination: SetNicknameView(viewModel: viewModel), isActive: $isButtonPressed) {
            Button(action: {
                viewModel.setPassword(password: password)
                isButtonPressed = true
            }, label: {
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

struct PasswordTextFieldVStack: View {
    @State var password = ""
    @State var confirmPassword = ""
    @State var isValid: Bool = true
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("비밀번호")
                .foregroundColor(.secondary)
            TextField("", text: $password)
                           .frame(height: 50)
                           .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                           .cornerRadius(10)
                           .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(isValid ? Color.dcdcdc : Color.red, lineWidth: 1))
            Spacer()
                .frame(height: 20)
            Text("비밀번호 확인")
                .foregroundColor(.secondary)
            TextField("", text: $confirmPassword)
                           .frame(height: 50)
                           .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                           .cornerRadius(10)
                           .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(isValid ? Color.dcdcdc : Color.red, lineWidth: 1))
        }
    }
}

struct SetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        SetPasswordView(viewModel: SignUpViewModel())
    }
}
