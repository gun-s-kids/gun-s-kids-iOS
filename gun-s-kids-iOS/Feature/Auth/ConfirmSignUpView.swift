//
//  ConfirmSignUpView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/12/16.
//

import SwiftUI

struct ConfirmSignUpView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(alignment: .center, spacing: 30) {
                    Spacer()
                        .frame(height: 50)
                    AuthExplainTextVStack(title: "가입 완료!", subtitle: "")
                    Image("welcome")
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .clipped()
                    NavigationLink(destination: LoginView()) {
                        Button(action: {},
                               label: {
                                Text("로그인하러 가기")
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
                .padding()
                .edgesIgnoringSafeArea(.all)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ConfirmSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmSignUpView()
    }
}
