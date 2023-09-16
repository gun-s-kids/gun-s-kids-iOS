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

    var body: some View {
        VStack(alignment: .center) {
            Text("로그인")
                .font(.title)
                .fontWeight(.bold)
                .padding(10)
            Text("거녕이와 아이들 앱에 오신 것을 환영합니다!")
                .foregroundColor(.gray)
                .font(.system(size: 15))
            Spacer()
                .frame(height: 80)
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
            Spacer()
                .frame(height: 30)
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
            Spacer()
                .frame(height: 30)
            Button(action: {
                print("")
            }, label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 57)
                    .frame(maxWidth: 305)
                    .background(.blue)
                    .cornerRadius(10)
            })
            .buttonStyle(PressableButtonStyle())
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
