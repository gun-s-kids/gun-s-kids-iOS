//
//  IntroduceView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/02/12.
//

import SwiftUI

struct IntroduceView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var content: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 15) {
                Spacer()
                    .frame(height: 50)
                SettingTitleVStack(title: "자기소개 변경")
                Spacer()
                    .frame(height: 15)
                VStack(alignment: .leading) {
                    Text("자기소개")
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                    TextEditor(text: $content)
                                .font(.body)
                                .frame(width: .infinity)
                                .frame(height: 131)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10)
                                         .stroke(Color.dcdcdc, lineWidth: 1))
                }
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

struct IntroduceView_Previews: PreviewProvider {
    static var previews: some View {
        IntroduceView()
    }
}
