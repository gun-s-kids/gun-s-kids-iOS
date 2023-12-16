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
                    LoginExplainTextVStack()
                    LoginTextFieldVStack(email: email, password: password)
                    FindUserInfoView()
                    SignInButton()
                    SignUpHStack()
                }
                .padding()
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct LoginExplainTextVStack: View {
    var body: some View {
        VStack {
            Text("로그인")
                .font(.title)
                .fontWeight(.bold)
                .padding(10)
            Text("거녕이와 아이들 앱에 오신 것을 환영합니다!")
                .foregroundColor(.gray)
                .font(.system(size: 15))
        }
    }
}

struct LoginTextFieldVStack: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Email")
                .foregroundColor(.secondary)
            TextField("", text: $email)
                           .frame(height: 50)
                           .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                           .cornerRadius(10)
                           .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.dcdcdc, lineWidth: 1))
            Spacer()
                .frame(height: 20)
            Text("Password")
                .foregroundColor(.secondary)
            TextField("", text: $password)
                           .frame(height: 50)
                           .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                           .cornerRadius(10)
                           .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.dcdcdc, lineWidth: 1))
        }
        .padding([.horizontal], 15)
    }
}

struct FindUserInfoView: View {
    var body: some View {
        HStack {
            NavigationLink(destination: SetMailView()) {
                Text("이메일 찾기")
                     .font(.system(size: 16))
            }
            Spacer()
                .frame(width: 50)
            NavigationLink(destination: SetMailView()) {
                Text("비밀번호 찾기")
                     .font(.system(size: 16))
            }
        }
    }
}

struct SignInButton: View {
    var body: some View {
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
    }
}

struct SignUpHStack: View {
    var body: some View {
        HStack {
            Text("계정이 없으신가요?")
                .foregroundColor(.gray)
                .font(.system(size: 15))
            Spacer()
                .frame(width: 10)
            NavigationLink(destination: SetMailView()) {
                Text("회원가입 하기")
                     .font(.system(size: 16))
            }
        }

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
