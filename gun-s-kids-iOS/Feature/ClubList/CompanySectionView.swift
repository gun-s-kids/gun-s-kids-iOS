//
//  CompanySectionView.swift
//  gun-s-kids-iOS
//
//  Created by Hhome on 2023/11/14.
//

import SwiftUI
import URLImage

struct CompanySectionView: View {
    @ObservedObject var viewModel: ClubListViewModel
    @State private var scrollToIndex: Int = 30
    
    var body: some View {
        if #available(iOS 16.0, *) {
            ScrollView(.horizontal) {
                ScrollViewReader { proxy in
                    LazyHStack {
                        ForEach(viewModel.companyInfoList) { company in
                            CompanyItemView(company: company)
                                .onTapGesture {
                                    viewModel.fetchClubList(selectedIndex: company.companyNo)
                                    scrollToIndex = company.companyNo * 30
                                }
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: -10))
                    .onChange(of: scrollToIndex, perform: { value in
                        proxy.scrollTo(value, anchor: .center)
                    })
                }
                .frame(maxHeight: 150.0)
                .scrollIndicators(.hidden)
            }
        } else {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(viewModel.companyInfoList) { company in
                        CompanyItemView(company: company)
                    }
                }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: -10))
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
                            .frame(width: 70.0, height: 70.0)
            })
            Text(company.companyNm)
        }.padding([.horizontal], 5)
    }
}

struct CompanySectionView_Previews: PreviewProvider {
    static var previews: some View {
        CompanySectionView(viewModel: ClubListViewModel())
    }
}
