//
//  ChangeDepartmentView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/02/12.
//

import SwiftUI

struct ChangeDepartmentView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State private var selectDepartmentIndex = 0
    var departments = ["SR팀", "온라인팀", "면세점팀", "한섬1팀"]
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 15) {
                Spacer()
                    .frame(height: 50)
                SettingTitleVStack(title: "부서 변경")
                Spacer()
                    .frame(height: 15)
                departmentComboBox
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

extension ChangeDepartmentView {
    var departmentComboBox: some View {
        VStack(alignment: .leading) {
            Text("부서")
                .foregroundColor(.secondary)
            Picker("Select Choice", selection: $selectDepartmentIndex) {
                ForEach(0 ..< departments.count) {
                    Text(departments[$0])
                }
            }.frame(maxWidth: .infinity, minHeight: 50)
                .cornerRadius(10)
                .accentColor(.black)
                .padding([.leading, .trailing])
                .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.dcdcdc, lineWidth: 1))
        }
    }
}
struct ChangeDepartmentView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeDepartmentView()
    }
}
