//
//  ClubMemberDetailView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/04/21.
//

import SwiftUI
import URLImage

struct ClubMemberDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    var member: MemberInfo
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center) {
                    profileImage
                    Spacer(minLength: 20)
                    profileDetail
                }
                .padding([.vertical], 20)
                .edgesIgnoringSafeArea(.all)
                memberIntroduction
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

extension ClubMemberDetailView {
    var backButton: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.black)
        }
    }
    
    var profileImage: some View {
        URLImage(URL(string: member.profileImg ?? "https://placebear.com/g/200/200")!,
                 content: { image in
            image
                .resizable()
                .frame(width: 233, height: 233)
                .padding(.horizontal, 0)
        })
    }
    
    var profileDetail: some View {
        VStack(spacing: 10) {
            Text(member.nickname)
                .font(.system(size: 15))
                .foregroundColor(.secondaryText)
            
            Text(member.companyNm ?? "")
                .font(.system(size: 15))
                .foregroundColor(.secondaryText)
            
            Text(member.role)
                .font(.system(size: 15))
                .foregroundColor(.secondaryText)
        }
    }
    
    var memberIntroduction: some View {
        VStack(alignment: .leading) {
            Text("자기소개")
                .foregroundColor(.gray)
                .font(.system(size: 15))
            Text(member.introduction ?? "자기소개자기소개자기소개자기소개자기소개 자기소개자기소개자기소개자기소개자기소개")
                .font(.body)
                .frame(width: 300, height: 150, alignment: .topLeading)
                .padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10))
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.dcdcdc, lineWidth: 1))
        }
        .padding([.horizontal], 15)
    }
}

struct ClubMemberDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ClubMemberDetailView(member: MemberInfo(memberNo: 1, memberNm: "안녕", nickname: "닉네일", companyNm: "현대아이티", role: "운영자", profileImg: nil, introduction: nil, roleNo: 0))
    }
}
