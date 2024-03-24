//
//  SetCompanyView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/03/24.
//

import SwiftUI

struct SetCompanyView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var viewModel: SignUpViewModel
    @Binding var path: Bool
    @State private var selectedCompanyIndex = 0
    @State private var selectedCompany = ""
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(alignment: .center, spacing: 15) {
                    Spacer()
                        .frame(height: 50)
                    AuthExplainTextVStack(title: "회원가입", subtitle: "소속된 회사을 선택해주세요!")
                    Spacer()
                        .frame(height: 15)
                    companyComboBox
                    Spacer()
                        .frame(height: 17)
                    nextButton
                }
                .padding()
                .edgesIgnoringSafeArea(.all)
            }
        }
        .navigationBarBackButtonHidden(true)
        .alert(isPresented: $viewModel.signUpFailure) {
            Alert(title: Text("회원가입 실패"), message: Text("유효하지 않은 정보입니다."), dismissButton: .default(Text("Dismiss")))
        }
    }
}

extension SetCompanyView {
    var companyComboBox: some View {
        VStack(alignment: .leading) {
            Text("소속 회사")
                .foregroundColor(.secondary)
            Picker("Select Choice", selection: $selectedCompanyIndex) {
                ForEach(0 ..< viewModel.companyInfoList.count) {
                    Text(viewModel.companyInfoList[$0].companyNm)
                }
            }
            .frame(maxWidth: .infinity, minHeight: 50)
                .cornerRadius(10)
                .accentColor(.black)
                .padding([.leading, .trailing])
                .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.dcdcdc, lineWidth: 1))
        }
    }
    
    var nextButton: some View {
        NavigationLink(destination: ConfirmSignUpView(path: $path), isActive: $viewModel.signUpSuccess) {
            Button(action: {
                print("index: \(selectedCompanyIndex)")
                viewModel.setCompanyNo(index: selectedCompanyIndex + 1)
                viewModel.signUp()
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
    }
}

struct SetCompanyView_Previews: PreviewProvider {
    static var previews: some View {
        SetCompanyView(viewModel: SignUpViewModel(), path: .constant(false))
    }
}
