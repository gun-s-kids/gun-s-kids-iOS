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
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 30) {
                Spacer()
                    .frame(height: 50)
                LoginExplainTextVStack(title: "이메일 인증", subtitle: "회사 이메일 인증을 해보아요!")
                EmailTextField(email: email)
                NavigationLink(destination: AuthMailView(), isActive: $isButtonPressed) {
                    Button(action: {
                        isButtonPressed = true
                    },
                           label: {
                                Text("인증번호 받기")
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

struct EmailTextField: View {
    @State var email = ""
    
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
        }
        .padding([.horizontal], 15)
    }
}

struct SetMailView_Previews: PreviewProvider {
    static var previews: some View {
        SetMailView()
    }
}
