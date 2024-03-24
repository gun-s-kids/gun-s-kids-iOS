//
//  MakeClubView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/03/03.
//

import SwiftUI

struct MakeClubView: View {
    @State var clubName: String = ""
    @State var content: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center) {
                    profileImage
                    Spacer(minLength: 30)
                    clubNameTextField
                    Spacer(minLength: 15)
                    clubIntroduce
                    Spacer(minLength: 30)
                    registerButton
                }
                .padding()
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

extension MakeClubView {
    var profileImage: some View {
        Image("avocado")
            .resizable()
            .scaledToFill()
            .frame(width: 180, height: 180)
            .clipped()
    }
    
    var clubNameTextField: some View {
        VStack(alignment: .leading) {
            Text("이메일")
                .foregroundColor(.gray)
                .font(.system(size: 15))
            TextField("", text: $clubName)
                           .frame(height: 50)
                           .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                           .cornerRadius(10)
                           .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.dcdcdc, lineWidth: 1))
        }
        .padding([.horizontal], 15)
    }
    
    var clubIntroduce: some View {
        VStack(alignment: .leading) {
            Text("자기소개로 나를 뽐내 보아요!")
                .foregroundColor(.gray)
                .font(.system(size: 15))
            TextEditor(text: $content)
                .font(.body)
                .frame(height: 188)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.dcdcdc, lineWidth: 1))
        }
        .padding([.horizontal], 15)
    }
    
    var registerButton: some View {
        Button(action: { print("") },
               label: {
                    Text("등록하기")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 57)
                        .frame(maxWidth: 231)
                        .background(Color.mainColor3)
                        .cornerRadius(10)
                    })
                .buttonStyle(PressableButtonStyle())
    }
}
struct MakeClubView_Previews: PreviewProvider {
    static var previews: some View {
        MakeClubView()
    }
}
