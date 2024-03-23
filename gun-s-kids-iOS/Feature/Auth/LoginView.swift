//
//  LoginView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/09/16.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var appRootManager: AppRootManager
    @StateObject var loginViewModel: LoginViewModel
    @StateObject var signUpViewModel: SignUpViewModel

    @State private var email = ""
    @State private var password = ""
    @State private var isButtonPressed = false
    @State var path: Bool = false
    
    init() {
        self._loginViewModel = StateObject.init(wrappedValue: LoginViewModel())
        self._signUpViewModel = StateObject.init(wrappedValue: SignUpViewModel())
    }

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(alignment: .center, spacing: 30) {
                    Spacer()
                        .frame(height: 50)
                    AuthExplainTextVStack(title: "로그인", subtitle: "거녕이와 아이들 앱에 오신 것을 환영합니다!")
                    loginTextFieldVStack
                    findUserInfoView
                    signInButton
                    signUpHStack
                }
                .padding()
                .edgesIgnoringSafeArea(.all)
            }
        }
        .onChange(of: loginViewModel.loginSuccess) { value in
            if value {
                appRootManager.currentRoot = .home
            }
        }
        .alert(isPresented: $loginViewModel.loginFailure) {
            Alert(title: Text("로그인 실패"), message: Text("유효하지 않은 아이디 혹은 비밀번호 입니다. "), dismissButton: .default(Text("Dismiss")))
        }
    }
}

extension LoginView {
    var loginTextFieldVStack: some View {
        VStack(alignment: .leading) {
            Text("이메일")
                .foregroundColor(.secondary)
            TextField("", text: $email)
                           .frame(height: 50)
                           .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                           .cornerRadius(10)
                           .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.dcdcdc, lineWidth: 1))
            Spacer()
                .frame(height: 20)
            Text("비밀번호")
                .foregroundColor(.secondary)
            SecureField("", text: $password)
                           .frame(height: 50)
                           .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                           .cornerRadius(10)
                           .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.dcdcdc, lineWidth: 1))
        }
        .padding([.horizontal], 15)
    }
    
    var findUserInfoView: some View {
        HStack {
            NavigationLink(destination: FindEmailWebView(url: "https://webmail.ehyundai.com/mail/find/id")) {
                Text("이메일 찾기")
                     .font(.system(size: 16))
            }
            Spacer()
                .frame(width: 50)
            NavigationLink(destination: SetMailView(viewModel: signUpViewModel, path: $path), isActive: $path) {
                Text("비밀번호 찾기")
                     .font(.system(size: 16))
            }
        }
    }
    
    var signInButton: some View {
        Button(action: {
            print("email: \(email) password: \(password)")
            loginViewModel.login(email: email, password: password)
        },
               label: {
                    Text("로그인")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 57)
                        .frame(maxWidth: 305)
                        .background(Color.mainColor3)
                        .cornerRadius(10)
                    })
                .buttonStyle(PressableButtonStyle())
    }
    
    var signUpHStack: some View {
        HStack {
            Text("계정이 없으신가요?")
                .foregroundColor(.gray)
                .font(.system(size: 15))
            Spacer()
                .frame(width: 10)
            NavigationLink(destination: SetMailView(viewModel: signUpViewModel, path: $path), isActive: $path) {
                Text("회원가입 하기")
                     .font(.system(size: 16))
            }
        }
    }
}

struct AuthExplainTextVStack: View {
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(10)
            Text(subtitle)
                .foregroundColor(.gray)
                .font(.system(size: 15))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
