//
//  ClubManagementView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/03/01.
//

import SwiftUI
import URLImage

struct ClubManagementView: View {
    var member: MemberInfo

    var body: some View {
        VStack(spacing: 10) {
            profileImage
            profileDetail
        }
        .frame(width: 157.5, height: 246)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.primaryShadow, lineWidth: 1)
                .shadow(color: Color.primaryShadow, radius: 10, x:4, y:4)
        )
    }
}

extension ClubManagementView {
    var profileImage: some View {
        URLImage(URL(string: member.profileImg ?? "https://placebear.com/g/200/200")!,
                 content: { image in
            image
                .resizable()
                .frame(width: 120, height: 120)
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
}

struct ClubManagementView_Previews: PreviewProvider {
    static var previews: some View {
        ClubManagementView(member: MemberInfo(memberNo: 1, memberNm: "", nickname: "두히", companyNm: "현대IT&E", role: "운영자", profileImg: nil, introduction: "", roleNo: 0))
    }
}
