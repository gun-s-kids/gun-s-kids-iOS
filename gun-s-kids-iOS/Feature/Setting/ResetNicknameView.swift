//
//  ResetNicknameView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/02/12.
//

import SwiftUI

struct ResetNicknameView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State var nickname = ""
    @State private var isValid = true
    @State var isButtonPressed: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 15) {
                Spacer()
                    .frame(height: 50)
                SettingTitleVStack(title: "닉네임 변경")
                Spacer()
                    .frame(height: 15)
                NicknameTextField(nickname: $nickname, isValid: $isValid)
                Text("이미 사용중인 별명입니다.")
                    .foregroundColor(isValid ? .clear : .red)
                Button(action: {
                    isButtonPressed = true
                    self.presentationMode.wrappedValue.dismiss()
                },
                label: {
                    Text("다음")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 57)
                        .frame(maxWidth: 305)
                        .background(Color.mainColor3)
                        .cornerRadius(10)
                })
                .buttonStyle(PressableButtonStyle())
            }
            .padding()
            .edgesIgnoringSafeArea(.all)
            }
    }
}

struct SettingTitleVStack: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title)
            .fontWeight(.bold)
            .padding(10)
    }
}


struct ResetNicknameView_Previews: PreviewProvider {
    static var previews: some View {
        ResetNicknameView()
    }
}


