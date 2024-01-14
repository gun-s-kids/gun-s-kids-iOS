//
//  BoardListView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/01/13.
//

import SwiftUI

struct BoardListView: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                BoardRow()
                BoardRow()
                BoardRow()
                BoardRow()
            }
            .padding([.bottom], 5)
            .listRowSeparator(.visible)
        }
    }
}

struct BoardListView_Previews: PreviewProvider {
    static var previews: some View {
        BoardListView()
    }
}
