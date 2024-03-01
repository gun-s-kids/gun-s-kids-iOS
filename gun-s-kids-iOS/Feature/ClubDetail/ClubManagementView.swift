//
//  ClubManagementView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/03/01.
//

import SwiftUI
import URLImage

struct ClubManagementView: View {
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
        URLImage(URL(string:"https://placebear.com/g/200/200")!,
                 content: { image in
            image
                .resizable()
                .frame(width: 120, height: 120)
                .padding(.horizontal, 0)
        })
    }
    
    var profileDetail: some View {
        VStack(spacing: 10) {
            Text("김OO")
                .font(.system(size: 15))
                .foregroundColor(.secondaryText)
            
            Text("현대 IT&E")
                .font(.system(size: 15))
                .foregroundColor(.secondaryText)
            
            Text("운영자")
                .font(.system(size: 15))
                .foregroundColor(.secondaryText)
        }
    }
}

struct ClubManagementView_Previews: PreviewProvider {
    static var previews: some View {
        ClubManagementView()
    }
}
