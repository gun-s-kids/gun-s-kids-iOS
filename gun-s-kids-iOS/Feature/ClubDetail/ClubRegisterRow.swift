//
//  ClubRegisterRow.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/03/03.
//

import SwiftUI
import URLImage
import URLImageStore

struct ClubRegisterRow: View {
    let registerInfo: RegisterInfo
    @State var isButtonChecked = false
    @State var showingAlert = false

    var body: some View {
        HStack {
            checkButton
            HStack(alignment: .center) {
                profileImage
                productDescription
                    .frame(width: 200)
            }
            .frame(width: 320, height: 150)
            .background(Color.primary.colorInvert())
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.primaryShadow, lineWidth: 1)
                    .shadow(color: Color.primaryShadow, radius: 10, x:4, y:4)
            )
            .onTapGesture {
                showingAlert = true
            }
            .alert("\(registerInfo.message)", isPresented: $showingAlert) {
                Button("승인", role: .cancel) {
                    showingAlert = false
                }
                Button("반려", role: .destructive) {
                    showingAlert = false
                }
            }
        }
        
    }
}

extension ClubRegisterRow {
    var checkButton: some View {
        Button(action: {
            isButtonChecked.toggle()
        }, label: {
            Image(systemName: self.isButtonChecked == true ? "checkmark.circle.fill" : "checkmark.circle")
                .resizable()
                .frame(width: 20, height: 20)
                .tint(.black)
        })
    }
    
    var profileImage: some View {
        URLImage(URL(string: registerInfo.profileImg)!,
                 content: { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .clipped()

        })
    }

    var productDescription: some View {
        VStack(alignment: .leading){
            HStack(spacing: 0) {
                Text(registerInfo.companyNm)
                    .foregroundColor(.black)
                Text(" | ")
                    .foregroundColor(.black)
                Text(registerInfo.nickname)
                    .foregroundColor(.black)
            }
            Text(registerInfo.message)
                .font(.system(size: 16))
                .fontWeight(.medium)
                .foregroundColor(.black)
                .padding([.top, .bottom], 6)
        }
        .padding([.leading, .bottom], 5)
        .padding([.top, .trailing])
    }
}

struct ClubRegisterRow_Previews: PreviewProvider {
    static var previews: some View {
        ClubRegisterRow(registerInfo: RegisterInfo(clubNo: 1, companyNm: "현대홈쇼핑", clubNm: "꽃꽂이 동호회", profileImg: "https://placebear.com/g/200/200", message: "가입 신청합니다!!!!", nickname: "아이디 123"))
    }
}
