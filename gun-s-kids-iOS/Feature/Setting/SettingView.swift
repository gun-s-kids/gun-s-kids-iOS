//
//  SettingView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/02/12.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("개인정보 수정"), content:  {
                    Text("비밀번호 변경")
                        .background(NavigationLink("", destination: CheckMailView())
                                    .opacity(0)
                        )
                    Text("닉네임 변경")
                        .background(NavigationLink("", destination: ResetNicknameView())
                                    .opacity(0)
                        )
                    Text("소속회사 변경")
                        .background(NavigationLink("", destination: ProfileView())
                                    .opacity(0)
                        )
                    Text("부서 변경")
                        .background(NavigationLink("", destination: ProfileView())
                                    .opacity(0)
                        )
                    Text("활동지역 변경")
                        .background(NavigationLink("", destination: ProfileView())
                                    .opacity(0)
                        )
                    Text("자기소개 변경")
                        .background(NavigationLink("", destination: ProfileView())
                                    .opacity(0)
                        )
                })
            }
            .listStyle(.plain)
            .navigationTitle("설정")
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
