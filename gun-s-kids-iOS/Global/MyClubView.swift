//
//  MyClubView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/11/05.
//

import SwiftUI

struct MyClubView: View {
    
    var body: some View {
        NavigationView {
            ClubSectionView()
            .navigationTitle("My Club !")
        }
    }
}

struct MyClubView_Previews: PreviewProvider {
    static var previews: some View {
        MyClubView()
    }
}
