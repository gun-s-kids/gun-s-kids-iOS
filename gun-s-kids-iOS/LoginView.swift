//
//  LoginView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/09/16.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isButtonPressed = false

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(alignment: .center, spacing: 30) {
                    Spacer()
                        .frame(height: 50)
                    VStack {
                        Text("로그인")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(10)
                        Text("거녕이와 아이들 앱에 오신 것을 환영합니다!")
                            .foregroundColor(.gray)
                            .font(.system(size: 15))
                    }
                    VStack(alignment: .leading) {
                        Text("Email")
                            .foregroundColor(.secondary)
                        TextField("", text: $email)
                            .textFieldStyle(.roundedBorder)
                        Spacer()
                            .frame(height: 20)
                        Text("Password")
                            .foregroundColor(.secondary)
                        TextField("", text: $password)
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding([.horizontal], 15)
                    HStack {
                        Button(action: {
                          print("")
                        }) {
                           Text("이메일 찾기")
                                .font(.system(size: 16))
                        }
                        Spacer()
                            .frame(width: 50)
                        Button(action: {
                          print("")
                        }) {
                           Text("비밀번호 찾기")
                                .font(.system(size: 16))
                        }
                    }
                    Button(action: { print("") },
                           label: {
                                Text("Sign In")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(height: 57)
                                    .frame(maxWidth: 305)
                                    .background(.blue)
                                    .cornerRadius(10)
                                })
                            .buttonStyle(PressableButtonStyle())
                    HStack {
                        Text("계정이 없으신가요?")
                            .foregroundColor(.gray)
                            .font(.system(size: 15))
                        Spacer()
                            .frame(width: 10)
                        NavigationLink(destination: SignUpView()) {
                            Text("회원가입 하기")
                                 .font(.system(size: 16))
                        }
                    }
                }
                .padding()
                .edgesIgnoringSafeArea(.all)
                }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
