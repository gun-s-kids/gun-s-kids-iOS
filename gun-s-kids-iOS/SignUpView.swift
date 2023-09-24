//
//  SignUpView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/09/16.
//

import SwiftUI

struct SignUpView: View {
    @State private var nickname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isValid = true

    var body: some View {
        VStack(alignment: .center) {
            Text("회원가입")
                .font(.title)
                .fontWeight(.bold)
                .padding(10)
            Text("회원가입을 해보아요!")
                .foregroundColor(.gray)
                .font(.system(size: 15))
            Spacer()
                .frame(height: 80)
            VStack(alignment: .leading) {
                Text("Nickname")
                    .foregroundColor(.secondary)
                TextField("", text: $nickname)
                    .textFieldStyle(.roundedBorder)
                Spacer()
                    .frame(height: 20)
                Text("Password")
                    .foregroundColor(.secondary)
                TextField("", text: $password)
                    .textFieldStyle(.roundedBorder)
                Spacer()
                    .frame(height: 20)
                Text("Confirm Password")
                    .foregroundColor(.secondary)
                TextField("", text: $confirmPassword)
                    .textFieldStyle(.roundedBorder)

            }
            Spacer()
                .frame(height: 30)
            Text("이미 사용중인 별명입니다.")
                .foregroundColor(isValid ? .clear : .red)
            Spacer()
                .frame(height: 30)
            Button(action: {
                print("")
            }, label: {
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
        .padding()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
