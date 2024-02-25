//
//  ClubListView.swift
//  gun-s-kids-iOS
//
//  Created by Hhome on 2023/11/6.
//

import SwiftUI

struct ClubListView: View {
    @StateObject var viewModel: ClubListViewModel
    
    init(){
        self._viewModel = StateObject.init(wrappedValue: ClubListViewModel())
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                Spacer(minLength: 30)
                CompanySectionView(viewModel: viewModel)
                Spacer(minLength: 30)
                ClubSectionView(viewModel: viewModel)
                Spacer(minLength: 10)
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    navigationBarButtonStack
                }
            }
        }
    }
}

extension ClubListView {
    var navigationBarButtonStack: some View {
        HStack {
            NavigationLink(destination: ProfileView()) {
                Image("magnifyglass")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            NavigationLink(destination: ProfileView()) {
                Image("myclub")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
        }
    }
}

struct ClubListView_Previews: PreviewProvider {
    static var previews: some View {
        ClubListView()
    }
}
