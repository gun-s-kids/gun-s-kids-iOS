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
                VStack {
                    Text("이메일 인증")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(10)
                    Text("회사 이메일 인증을 해보아요!")
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                }
                VStack(alignment: .leading) {
                    Text("Email")
                        .foregroundColor(.secondary)
                    TextField("", text: $email)
                        .textFieldStyle(.roundedBorder)
                }
                .padding([.horizontal], 15)
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

struct SetMailView_Previews: PreviewProvider {
    static var previews: some View {
        SetMailView()
    }
}
