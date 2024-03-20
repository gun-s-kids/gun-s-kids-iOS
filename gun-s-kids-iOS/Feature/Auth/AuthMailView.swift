//
//  AuthMailView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/09/16.
//

import SwiftUI
import AEOTPTextField

struct AuthMailView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: SignUpViewModel
    @State private var authCode: String = ""
    @State private var isValid = true
    @State private var isButtonPressed = false
    @Binding var path: Bool

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(alignment: .center, spacing: 15) {
                    Spacer()
                        .frame(height: 50)
                    AuthExplainTextVStack(title: "메일 인증", subtitle: "등록한 메일로 발송된 인증 코드를 입력하세요!")
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
                    authCodeResendVStack
                    Text("인증번호가 일치하지 않습니다.")
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
        .navigationBarBackButtonHidden(true)
    }
}

extension AuthMailView {
    var authCodeResendVStack: some View {
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
    }
    
    var nextButton: some View {
        NavigationLink(destination: SetPasswordView(viewModel: viewModel, path: $path), isActive: $isButtonPressed) {
            Button(action: {
                viewModel.authCode(code: authCode)
                isButtonPressed = true
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

struct AuthMailView_Previews: PreviewProvider {
    static var previews: some View {
        AuthMailView(viewModel: SignUpViewModel(), path: .constant(false))
    }
}
