//
//  MyClubView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/11/05.
//

import SwiftUI

struct MyClubView: View {
    
    let myClubSamples = [
        MyClub(title: "[논알콜] 소.취.생 (소소한 취미 생활)", imageName: "fig", foundationDate: "2022. 08. 08", members: 32, company: "한섬"),
        MyClub(title: "마운틴 크루 (등산 & 러닝 & 여행)", imageName: "avocado", foundationDate: "2022. 08. 08", members: 48, company: "현대 IT&E"),
        MyClub(title: "[보드게임] On Board", imageName: "banana", foundationDate: "2022. 08. 08", members: 14, company: "현대홈쇼핑")
    ]
    
    var body: some View {
        NavigationView {
            List(myClubSamples) { club in
                MyClubRow(clubInfo: club)
            }
            .listStyle(.plain)
            .navigationTitle("My Club !")
        }
    }
}

struct MyClubView_Previews: PreviewProvider {
    static var previews: some View {
        MyClubView()
    }
}
