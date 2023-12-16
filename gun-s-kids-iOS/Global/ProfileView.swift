//
//  ProfileView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/10/09.
//

import SwiftUI

struct ProfileView: View {
    @State var content: String = ""
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(alignment: .center, spacing: 30) {
                    Spacer()
                        .frame(height: 30)
                    Text("내 프로필")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(10)
                    HStack {
                        Spacer()
                            .frame(width: 20)
                        profileImage
                        Spacer()
                            .frame(width: 10)
                        profileDescription
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.primary.colorInvert())
                    .cornerRadius(6)
                    .padding(.vertical, 8)
                    
                    VStack(alignment: .leading) {
                        Text("자기소개로 나를 뽐내 보아요!")
                            .foregroundColor(.gray)
                            .font(.system(size: 15))
                        TextEditor(text: $content)
                                    .font(.body)
                                    .frame(maxWidth: 328)
                                    .frame(height: 188)
                                    .cornerRadius(10)
                                    .overlay(RoundedRectangle(cornerRadius: 10)
                                             .stroke(Color.dcdcdc, lineWidth: 1))
                    }
                    
                    Button(action: { print("") },
                           label: {
                                Text("Edit")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(height: 32)
                                    .frame(maxWidth: 110)
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
}

extension ProfileView {
    var profileImage: some View {
        Image("avocado")
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100)
            .clipped()
    }
    
    var profileDescription: some View {
        VStack(alignment: .leading, spacing: 7){
            Text("닉네임")
                .font(.system(size: 20))
            
            HStack {
                Text("현대 IT&E")
                    .font(.system(size: 14))
                    .foregroundColor(Color.secondary)
                
                Text("|")
                    .font(.system(size: 14))
                    .foregroundColor(Color.secondary)
                
                Text("한섬 1팀")
                    .font(.system(size: 14))
                    .foregroundColor(Color.secondary)
            }
            
            HStack {
                Text("서울특별시 강남구")
                    .font(.system(size: 14))
                    .foregroundColor(Color.secondary)
                
                Text("|")
                    .font(.system(size: 14))
                    .foregroundColor(Color.secondary)
                
                Text("1999.09.01")
                    .font(.system(size: 14))
                    .foregroundColor(Color.secondary)
            }
        }
        .padding([.leading, .bottom], 12)
        .padding([.top, .trailing])
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
