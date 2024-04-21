//
//  ClubMemberView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/04/21.
//

import SwiftUI

struct ClubMemberView: View {
    var memberInfo: [MemberInfo]
    var sample: [MemberInfo] = [
        MemberInfo(memberNo: 1, memberNm: "안녕", nickname: "닉네일", companyNm: "현대아이티", role: "운영자", profileImg: nil, introduction: "", roleNo: 0),
        MemberInfo(memberNo: 2, memberNm: "그녕", nickname: "그녕", companyNm: "현대홈쇼핑", role: "멤버", profileImg: nil, introduction: "", roleNo: 1),
        MemberInfo(memberNo: 3, memberNm: "양아", nickname: "양아", companyNm: "한섬", role: "운영자", profileImg: nil, introduction: "", roleNo: 0),
        MemberInfo(memberNo: 4, memberNm: "빠아", nickname: "빠아", companyNm: "현대백화점", role: "멤버", profileImg: nil, introduction: "", roleNo: 1),
        MemberInfo(memberNo: 5, memberNm: "빠아", nickname: "크아", companyNm: "현대백화점", role: "멤버", profileImg: nil, introduction: "", roleNo: 1),
        MemberInfo(memberNo: 6, memberNm: "빠아", nickname: "크아", companyNm: "현대백화점", role: "멤버", profileImg: nil, introduction: "", roleNo: 1)]
    
    
    private var items: [GridItem] {
        Array(repeating: .init(.flexible(minimum: 80)), count: 3)
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("운영진")
                        .foregroundColor(.secondary)
                    LazyVGrid(columns: items, spacing: 20) {
                        ForEach(sample) { info in
                            if info.roleNo == 0 {
                                ClubManagementView(member: info)
                            }
                        }
                    }
                }
                .padding([.horizontal], 15)
                .padding([.vertical], 25)
                
                VStack(alignment: .leading) {
                    Text("멤버")
                        .foregroundColor(.secondary)
                    LazyVGrid(columns: items, spacing: 20) {
                        ForEach(sample) { info in
                            if info.roleNo == 1 {
                                ClubManagementView(member: info)
                            }
                        }
                    }
                }.padding([.horizontal], 15)
            }
        }
    }
}

struct ClubMemberView_Previews: PreviewProvider {
    static var previews: some View {
        ClubMemberView(memberInfo: [
            MemberInfo(memberNo: 1, memberNm: "안녕", nickname: "닉네일", companyNm: "현대아이티", role: "운영자", profileImg: "", introduction: "", roleNo: 0),
            MemberInfo(memberNo: 2, memberNm: "그녕", nickname: "그녕", companyNm: "현대홈쇼핑", role: "운영자", profileImg: "", introduction: "", roleNo: 0),
            MemberInfo(memberNo: 3, memberNm: "양아", nickname: "양아", companyNm: "한섬", role: "운영자", profileImg: "", introduction: "", roleNo: 0),
            MemberInfo(memberNo: 4, memberNm: "빠아", nickname: "빠아", companyNm: "현대백화점", role: "운영자", profileImg: "", introduction: "", roleNo: 0)])
    }
}
