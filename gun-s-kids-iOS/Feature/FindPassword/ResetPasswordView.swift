//
//  ResetPasswordView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/12/16.
//

import SwiftUI

struct ResetPasswordView: View {
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isValid = true
    @State private var isButtonPressed = false

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 15) {
                Spacer()
                    .frame(height: 50)
                AuthExplainTextVStack(title: "비밀번호 재설정", subtitle: "비밀번호를 재설정하세요!")
                Spacer()
                    .frame(height: 15)
                PasswordTextFieldVStack(password: $password, confirmPassword: $confirmPassword, isValid: $isValid)
                Text("비밀번호가 일치하지 않습니다.")
                    .foregroundColor(isValid ? .clear : .red)
                NavigationLink(destination: LoginView(), isActive: $isButtonPressed) {
                    Button(action: {
                        isButtonPressed = true
                    }, label: {
                        Text("재설정")
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
            .padding()
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
