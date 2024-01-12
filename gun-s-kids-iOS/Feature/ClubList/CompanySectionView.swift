//
//  CompanySectionView.swift
//  gun-s-kids-iOS
//
//  Created by Hhome on 2023/11/14.
//

import SwiftUI
import URLImage

struct CompanySectionView: View {
    var companyInfoList: [CompanyInfo]
    
    var body: some View {
        if #available(iOS 16.0, *) {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(companyInfoList) { company in
                        CompanyItemView(company: company)
                    }
                }
            }
            .frame(maxHeight: 150.0)
            .scrollIndicators(.hidden)
        } else {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(companyInfoList) { company in
                        CompanyItemView(company: company)
                    }
                }
            }
            .frame(maxHeight: 160.0)
        }
    }
}

struct CompanyItemView: View {
    let company: CompanyInfo

    var body: some View {
        VStack {
            URLImage(URL(string: company.companyImg)!,
                     content: { image in
                        image
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 90.0, height: 90.0)
            })
            Text(company.companyNm)
        }.padding([.horizontal], 5)
    }
}

struct CompanySectionView_Previews: PreviewProvider {
    static var previews: some View {
        CompanySectionView(companyInfoList: [CompanyInfo(companyNo: 1, companyNm: "aa", companyImg: "aaa")])
    }
}
