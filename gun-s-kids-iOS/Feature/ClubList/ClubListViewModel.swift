//
//  ClubListViewModel.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/01/12.
//

import Foundation
import Combine
import Alamofire

class ClubListViewModel: ObservableObject {
    var subscriptions = Set<AnyCancellable>()
    
    @Published var companyInfoList = [CompanyInfo]()
    @Published var clubInfoList = [Datum]()
    @Published var clubList = [Club]()
    @Published var selectedIndex: Int?
    
    init()
        {
            print(#fileID,#function, #line, "")
            fetchCompanyList()
        }
    
    func fetchCompanyList() {
        APIService.shared.getCompanyListData()
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("[API] getCompanyList ERROR : \(err)")
                case .finished:
                    print("[API] getCompanyList Finish")
                }
            } receiveValue: { (value: [CompanyInfo]) in
                self.companyInfoList = value
                print(self.companyInfoList)
            }.store(in: &subscriptions)
    }
    
    func fetchClubList(selectedIndex: Int) {
        APIService.shared.getClubListData(companyNo: selectedIndex)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("[API] getClubList ERROR : \(err)")
                case .finished:
                    print("[API] getClubList Finish")
                }
            } receiveValue: { (value: [Datum]) in
                self.clubInfoList = value
                print(self.clubInfoList)
            }.store(in: &subscriptions)
    }
}
