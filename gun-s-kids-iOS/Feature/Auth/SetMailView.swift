//
//  SetMailView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/10/01.
//

import SwiftUI

struct SetMailView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: SignUpViewModel
    @State var email = ""
    @State var showNextView: Bool = false
    @State var isValid: Bool = true
    @Binding var path: Bool

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(alignment: .center, spacing: 15) {
                    Spacer()
                        .frame(height: 50)
                    AuthExplainTextVStack(title: "이메일 인증", subtitle: "회사 이메일 인증을 해보아요!")
                    Spacer()
                        .frame(height: 15)
                    EmailTextField(email: $email)
                    Text("유효한 이메일이 아닙니다.")
                        .foregroundColor(isValid ? .clear : .red)
                    nextButton
                }
                .padding()
                .edgesIgnoringSafeArea(.all)
                }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    backButton
                }
            }
        }
        .onChange(of: viewModel.sendEmailCodeFailure) { value in
            isValid = !value
        }
        .navigationBarBackButtonHidden(true)
    }
}

extension SetMailView {
    var nextButton: some View {
        NavigationLink(destination: AuthMailView(viewModel: viewModel, path: $path), isActive: $viewModel.sendEmailCodeSuccess) {
            Button(action: {
                viewModel.sendEmailAuthCode(email: email)
                print("email: \(email)")
                },
                   label: {
                    Text("인증하기")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 57)
                        .frame(maxWidth: 305)
                        .background(Color.mainColor3)
                        .cornerRadius(10)
                    })
                .buttonStyle(PressableButtonStyle())
        }
    }
    
    var backButton: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.black)
        }
    }
}

struct EmailTextField: View {
    @Binding var email: String
    
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
        SetMailView(viewModel: SignUpViewModel(), path: .constant(false))
    }
}
