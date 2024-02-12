//
//  ChangeCompanyView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/02/12.
//

import SwiftUI

struct ChangeCompanyView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State private var selectedCompanyIndex = 0
    @State private var selectedCompany = ""
    var companys = ["현대 IT&E", "현대홈쇼핑", "현대백화점"]
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 15) {
                Spacer()
                    .frame(height: 50)
                SettingTitleVStack(title: "소속회사 변경")
                Spacer()
                    .frame(height: 15)
                companyComboBox
                Spacer()
                    .frame(height: 17)
                Button(action: {
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

extension ChangeCompanyView {
    var companyComboBox: some View {
        VStack(alignment: .leading) {
            Text("소속 회사")
                .foregroundColor(.secondary)
            Picker("Select Choice", selection: $selectedCompanyIndex) {
                ForEach(0 ..< companys.count) {
                    Text(companys[$0])
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
}

struct ChangeCompanyView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeCompanyView()
    }
}
