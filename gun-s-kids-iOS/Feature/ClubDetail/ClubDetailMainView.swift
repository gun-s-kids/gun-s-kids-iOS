//
//  ClubDetailMainView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/12/03.
//

import SwiftUI
import Parchment

struct ClubDetailMainView: View {
    
    let items = [
            PagingIndexItem(index: 0, title: "홈"),
            PagingIndexItem(index: 1, title: "게시판"),
            PagingIndexItem(index: 2, title: "일정"),
            PagingIndexItem(index: 3, title: "채팅")
        ]
    
    var option: PagingOptions?
    var navigationTitle: String
    
    init(title: String) {
        option = PagingOptions()
        option?.menuItemSize = .sizeToFit(minWidth: 80, height: 50)
        option?.indicatorOptions = .hidden
        option?.selectedTextColor = .black
        option?.textColor = UIColor.secondaryLabel
        navigationTitle = title
    }
    
    var body: some View {
        NavigationView {
            PageView(options: option ?? PagingOptions(), items: items) { item in
                Text(item.title)
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(navigationTitle)
    }
}

struct ClubDetailMainView_Previews: PreviewProvider {
    static var previews: some View {
        ClubDetailMainView(title: "안녕")
    }
}
