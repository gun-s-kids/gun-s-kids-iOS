//
//  CheckMailView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/12/16.
//

import SwiftUI

struct CheckMailView: View {
    @State var email = ""
    @State var isButtonPressed: Bool = false
    @State var isValid: Bool = true
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 15) {
                Spacer()
                    .frame(height: 50)
                LoginExplainTextVStack(title: "비밀번호 찾기", subtitle: "회원가입 시 사용한 이메일을 입력하세요.")
                Spacer()
                    .frame(height: 15)
                EmailTextField(email: email)
                Text("유효한 이메일이 아닙니다.")
                    .foregroundColor(isValid ? .clear : .red)
                NavigationLink(destination: ReauthMailView(), isActive: $isButtonPressed) {
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

struct CheckMailView_Previews: PreviewProvider {
    static var previews: some View {
        CheckMailView()
    }
}
