//
//  ReauthMailView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/12/16.
//

import SwiftUI
import AEOTPTextField

struct ReauthMailView: View {
    @State private var authCode: String = ""
    @State private var isValid = true
    @State private var isButtonPressed = false

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 15) {
                Spacer()
                    .frame(height: 50)
                LoginExplainTextVStack(title: "비밀번호 찾기", subtitle: "등록한 메일로 발송된 인증 코드를 입력하세요!")
                AEOTPView(text: $authCode,
                          slotsCount: 4,
                          width: .infinity,
                          height: 80,
                          otpFilledBorderColor: .clear,
                          otpFontSize: 35,
                          otpFont: UIFont.systemFont(ofSize: 35),
                          isSecureTextEntry: false,
                          onCommit: {
                }).padding()
                AuthCodeResendVStack()
                Text("인증번호가 일치하지 않습니다.")
                    .foregroundColor(isValid ? .clear : .red)
                NavigationLink(destination: ResetPasswordView(), isActive: $isButtonPressed) {
                    Button(action: {
                        isButtonPressed = true
                    },
                           label: {
                                Text("인증하기")
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

struct ReauthMailView_Previews: PreviewProvider {
    static var previews: some View {
        ReauthMailView()
    }
}
