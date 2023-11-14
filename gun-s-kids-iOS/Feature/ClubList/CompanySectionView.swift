//
//  CompanySectionView.swift
//  gun-s-kids-iOS
//
//  Created by Hhome on 2023/11/14.
//

import SwiftUI

struct CompanySectionView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(Company.sample) { company in
                    Text(company.name)
                }
            }
        }
    }
}

#Preview {
    CompanySectionView()
}
