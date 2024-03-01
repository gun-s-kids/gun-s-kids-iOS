//
//  ClubDetailHomeView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/03/01.
//

import SwiftUI
import URLImage

struct ClubDetailHomeView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 30) {
                clubRepresentImage
                introduceClub
                introduceClubManagement
            }
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
}

struct ClubDetailHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ClubDetailHomeView()
    }
}
