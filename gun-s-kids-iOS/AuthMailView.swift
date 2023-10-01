//
//  AuthMailView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/09/16.
//

import SwiftUI

struct AuthMailView: View {
    @State private var authCode = "0000"
    @State private var isValid = true
    @State private var isButtonPressed = false

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 30) {
                Spacer()
                    .frame(height: 50)
                Text("메일 인증")
                    .font(.title)
                    .fontWeight(.bold)
                Text("등록한 메일로 발송된 인증 코드를 입력하세요!")
                    .foregroundColor(.gray)
                    .font(.system(size: 15))
                AuthCodeTextField(authCode: $authCode)
                VStack(alignment: .center) {
                    Text("인증코드를 받지 못했나요?")
                        .foregroundColor(.gray)
                        .font(.system(size: 13))
                    Spacer()
                        .frame(height: 10)
                    Button(action: {
                        print("")
                    }, label: {
                        Text("인증코드 재발송하기")
                            .font(.system(size: 13))
                    })
                }
                NavigationLink(destination: SignUpView(), isActive: $isButtonPressed) {
                    Button(action: {
                        isButtonPressed = true
                    },
                           label: {
                                Text("Sign Up")
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
            .padding()
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct AuthMailView_Previews: PreviewProvider {
    static var previews: some View {
        AuthMailView()
    }
}
