//
//  ClubDetailMainView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/12/03.
//

import SwiftUI
import Parchment

struct ClubDetailMainView: View {
    @Environment(\.presentationMode) var presentationMode

    let items = [
            PagingIndexItem(index: 0, title: "홈"),
            PagingIndexItem(index: 1, title: "게시판"),
            PagingIndexItem(index: 2, title: "일정"),
            PagingIndexItem(index: 3, title: "채팅")
        ]
    
    var option: PagingOptions?
    var navigationTitleString: String
    
    init(title: String) {
        option = PagingOptions()
        option?.menuItemSize = .sizeToFit(minWidth: 80, height: 50)
        option?.indicatorOptions = .hidden
        option?.selectedTextColor = .black
        option?.textColor = UIColor.secondaryLabel
        navigationTitleString = title
    }
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationView {
                PageView(options: option ?? PagingOptions(), items: items) { item in
                    VStack {
                        switch item.index {
                        case 0:
                            ClubDetailHomeView()
                        case 1:
                            BoardListView()
                        default:
                            Text(item.title)
                                .font(.largeTitle)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .navigationBarTitle(navigationTitleString, displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        backButton
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        } else {
            NavigationView {
                PageView(options: option ?? PagingOptions(), items: items) { item in
                    Text(item.title)
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                }
                .navigationBarTitle(navigationTitleString, displayMode: .inline)
                .navigationBarItems(leading: backButton)
            }
            .navigationBarBackButtonHidden(true)
        }
        
    }
}

extension ClubDetailMainView {
    var boardListView: some View {
        BoardListView()
    }
    
    var navigationTitle: some View {
        Text(navigationTitleString)
            .foregroundColor(.black)
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

struct ClubDetailMainView_Previews: PreviewProvider {
    static var previews: some View {
        ClubDetailMainView(title: "안녕")
    }
}
