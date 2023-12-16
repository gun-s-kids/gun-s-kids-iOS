//
//  SetMailView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/10/01.
//

import SwiftUI

struct SetMailView: View {
    @State var email = ""
    @State var isButtonPressed: Bool = false
    @State var isValid: Bool = true
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 15) {
                Spacer()
                    .frame(height: 50)
                LoginExplainTextVStack(title: "이메일 인증", subtitle: "회사 이메일 인증을 해보아요!")
                Spacer()
                    .frame(height: 15)
                EmailTextField(email: email)
                Text("유효한 이메일이 아닙니다.")
                    .foregroundColor(isValid ? .clear : .red)
                NavigationLink(destination: AuthMailView(), isActive: $isButtonPressed) {
                    Button(action: {
                        isButtonPressed = true
                        },
                           label: {
                            Text("인증하기")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(height: 57)
                                .frame(maxWidth: 305)
                                .background(Color.mainColor3)      .cornerRadius(10)
                            })
                        .buttonStyle(PressableButtonStyle())
                }
            }
            .padding()
            .edgesIgnoringSafeArea(.all)
            }
    }
}

struct EmailTextField: View {
    @State var email = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("이메일")
                .foregroundColor(.secondary)
            TextField("", text: $email)
                           .frame(height: 50)
                           .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                           .cornerRadius(10)
                           .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.dcdcdc, lineWidth: 1))
        }
        .padding([.horizontal], 15)
    }
}

struct SetMailView_Previews: PreviewProvider {
    static var previews: some View {
        SetMailView()
    }
}
