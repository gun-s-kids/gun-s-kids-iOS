//
//  CompanySectionView.swift
//  gun-s-kids-iOS
//
//  Created by Hhome on 2023/11/14.
//

import SwiftUI

struct CompanySectionView: View {
    var body: some View {
        if #available(iOS 16.0, *) {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(Company.sample) { company in
                        CompanyItemView(company: company)
                    }
                }
            }
            .frame(maxHeight: 150.0)
            .scrollIndicators(.hidden)
        } else {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(Company.sample) { company in
                        CompanyItemView(company: company)
                    }
                }
            }
            .frame(maxHeight: 160.0)
        }
    }
}

struct CompanyItemView: View {
    let company: Company

    var body: some View {
        VStack {
            company.image
                .resizable()
                .clipShape(Circle())
                .frame(width: 90.0, height: 90.0)
            Text(company.name)
        }.padding([.horizontal], 5)
    }
}

struct CompanySectionView_Previews: PreviewProvider {
    static var previews: some View {
        CompanySectionView()
    }
}
