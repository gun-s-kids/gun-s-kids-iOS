//
//  ClubDetailHomeView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/03/01.
//

import SwiftUI
import URLImage
import URLImageStore

struct ClubDetailHomeView: View {
    @State var isButtonPressed: Bool = false
    @State var showingAlert: Bool = false
    @State var messageToManagement: String = ""

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView(.vertical) {
                VStack(spacing: 30) {
                    clubRepresentImage
                    introduceClub
                    introduceClubManagement
                    Spacer(minLength: 60)
                }
            }
            registerButton
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 20))
        }
    }
}

extension ClubDetailHomeView {
    var clubRepresentImage: some View {
        URLImage(URL(string:"https://placebear.com/g/200/100")!,
                 content: { image in
            image
                .resizable()
                .scaledToFill()
                .padding(.horizontal, 0)
        }).frame(width: UIScreen.main.bounds.width, height: 250)
    }
    
    var introduceClub: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("동아리 소개")
                .font(.system(size: 15))
                .foregroundColor(.secondaryText)
            
            HStack {
                Text("너무너무재밌었어요옹너무너무재밌었어요옹너무너무재밌었어요옹너무너무재밌었어요옹너무너무재밌었")
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    .padding([.leading, .top, .bottom], 20)
                Spacer()
            }.overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.primaryShadow, lineWidth: 1)
                    .shadow(color: Color.primaryShadow, radius: 10, x:4, y:4)
            )
        }
        .padding(.horizontal, 20)
    }
    
    var introduceClubManagement: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("운영진 소개")
                .font(.system(size: 15))
                .foregroundColor(.secondaryText)
            if #available(iOS 16.0, *) {
                ScrollView(.horizontal) {
                    LazyHStack {
                        ClubManagementView()
                        ClubManagementView()
                        ClubManagementView()
                    }
                }.scrollIndicators(.hidden)
            } else {
                ScrollView(.horizontal) {
                    LazyHStack {
                        ClubManagementView()
                        ClubManagementView()
                        ClubManagementView()
                    }
                }
            }
        }
        .padding(.horizontal, 20)
    }
    
    var registerButton: some View {
        Button(action: {
            showingAlert = true
        }) {
            HStack {
                Image(systemName: "plus")
                Text("가입하기")
                    .font(.title3)
            }
        }
        .padding()
        .background(Color.mainColor4)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .alert("가입인사를 작성해주세요.", isPresented: $showingAlert) {
            TextField("", text: $messageToManagement)
            Button("확인", role: .cancel) {
                showingAlert = false
            }
            Button("취소", role: .destructive) {
                showingAlert = false
            }
        }
    }
    
    var manageButton: some View {
        Button(action: {
            isButtonPressed = true
        }) {
            HStack {
                Image(systemName: "plus")
                Text("관리하기")
                    .font(.title3)
            }
        }
        .padding()
        .background(Color.mainColor4)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

struct ClubDetailHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ClubDetailHomeView()
    }
}
