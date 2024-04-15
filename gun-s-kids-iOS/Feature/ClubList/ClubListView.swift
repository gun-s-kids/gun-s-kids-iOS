//
//  ClubListView.swift
//  gun-s-kids-iOS
//
//  Created by Hhome on 2023/11/6.
//

import SwiftUI

struct ClubListView: View {
    @StateObject var viewModel: ClubListViewModel
    @State var isButtonPressed = false
    
    init(){
        self._viewModel = StateObject.init(wrappedValue: ClubListViewModel())
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
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
                registerButton
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 20))
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
    
    var registerButton: some View {
        NavigationLink(destination: MakeClubView(viewModel: viewModel), isActive: $isButtonPressed) {
            Button(action: {
                isButtonPressed = true
            }) {
                HStack {
                    Image(systemName: "plus")
                    Text("동아리")
                        .font(.title3)
                }
            }
            .padding()
            .background(Color.mainColor4)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
}

struct ClubListView_Previews: PreviewProvider {
    static var previews: some View {
        ClubListView()
    }
}
