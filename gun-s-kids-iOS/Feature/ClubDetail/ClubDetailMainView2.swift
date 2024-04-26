//
//  ClubDetailMainView2.swift
//  gun-s-kids-iOS
//
//  Created by Hhome on 2024/4/22.
//

import SwiftUI

struct ClubDetailMainView2: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var activeMenu = Menu.main
    var clubDetail: ClubInfo

    enum Menu {
        case main
        case board
        case member
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    sinceLabel
                    headerTabView
                    TabView(selection: $activeMenu) {
                        ClubDetailHomeView(clubInfo: clubDetail)
                            .tag(Menu.main)
                        
                        BoardListView(clubNo: clubDetail.clubNo)
                            .tag(Menu.board)
                        
                        ClubMemberView(memberList: clubDetail.adminList)
                            .tag(Menu.member)
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 120)
                }
            }
            .navigationBarTitle(clubDetail.clubNm, displayMode: .inline)
            .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        backButton
                    }
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

extension ClubDetailMainView2 {
    var sinceLabel: some View {
        Text("Since \(clubDetail.createdDate)")
            .font(.system(size: 10))
            .foregroundColor(.sinceColor)
    }
    
    var boardListView: some View {
        BoardListView(clubNo: 1)
    }
    
    var headerTabView: some View {
        HStack(alignment: .center, spacing: 90) {
            Button(action: {
                activeMenu = .main
            }, label: {
                activeMenu == .main ?
                Text("홈").font(.headline).foregroundColor(.black)
                : Text("홈").font(.headline).foregroundColor(.grayColor)
            })
            Button(action: {
                activeMenu = .board
            }, label: {
                activeMenu == .board ?
                Text("게시판").font(.headline).foregroundColor(.black)
                : Text("게시판").font(.headline).foregroundColor(.grayColor)
            })
            Button(action: {
                activeMenu = .member
            }, label: {
                activeMenu == .member ?
                Text("멤버").font(.headline).foregroundColor(.black)
                : Text("멤버").font(.headline).foregroundColor(.grayColor)
            })
        }.padding([.top], 20)
    }
    
    var backButton: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.black)
        }
    }
}

struct ClubDetailMainView2_Previews: PreviewProvider {
    static var previews: some View {
        ClubDetailMainView2(clubDetail: ClubInfo(clubNo: 1, companyNm: "현대IT&E", clubNm: "자바락", clubDesc: "클라이밍 동호회", clubImg: "https://gunskids.s3.ap-northeast-2.amazonaws.com/6a66bab5-a47f-4dc0-8560-eeb5870f8873", createdDate: "2024-03-20T08:28:23.297843", adminList: [MemberInfo(memberNo: 1, memberNm: "", nickname: "두히", companyNm: "현대IT&E", role: "운영자", profileImg: nil, introduction: "", roleNo: 0)]))
    }
}
