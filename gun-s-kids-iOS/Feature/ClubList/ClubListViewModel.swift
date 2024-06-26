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
    var localCacheClub = Dictionary<Int, [Club]>()
    
    @Published var companyInfoList = [CompanyInfo]()
    @Published var clubInfoList = [Club]()
    @Published var clubInfo = ClubInfo(clubNo: 0, companyNm: "", clubNm: "", clubDesc: "", clubImg: "", createdDate: "", adminList: [])
    @Published var isFetchedData: Bool = false
    @Published var registerClubFailure: Bool = false
    @Published var registerClubSuccess: Bool = false
    @Published var registerClubFailureMessage: String = ""
    
    init()
        {
            print(#fileID,#function, #line, "")
            fetchCompanyList()
            fetchAllClubList()
        }
    
    func fetchCompanyList() {
        MainAPIService.shared.getCompanyListData()
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
        if localCacheClub[selectedIndex] == nil {
            MainAPIService.shared.getClubListData(companyNo: selectedIndex)
                .sink { completion in
                    switch completion {
                    case .failure(let err):
                        print("[API] getClubList ERROR : \(err)")
                    case .finished:
                        print("[API] getClubList Finish")
                    }
                } receiveValue: { (value: [Club]) in
                    self.clubInfoList = value
                    self.localCacheClub[selectedIndex] = value
                    print(self.clubInfoList)
                }.store(in: &subscriptions)
        } else {
            self.clubInfoList = localCacheClub[selectedIndex] ?? []
        }
    }
    
    func fetchAllClubList() {
        MainAPIService.shared.getAllClubListData()
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("[API] getAllClubList ERROR : \(err)")
                case .finished:
                    print("[API] getAllClubList Finish")
                }
            } receiveValue: { (value: [Club]) in
                self.clubInfoList = value
                print(self.clubInfoList)
            }.store(in: &subscriptions)
    }
    
    func fetchClubInfo(clubNo: Int) {
        MainAPIService.shared.getClubInfo(clubNo: clubNo)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("[API] getClubList ERROR : \(err)")
                case .finished:
                    print("[API] getClubList Finish")
                }
            } receiveValue: { (value: ClubInfo) in
                self.clubInfo = value
                self.isFetchedData = true
            }.store(in: &subscriptions)
    }
    
    func registerClub(companyNo: Int, clubNm: String, clubDesc: String, clubImg: UIImage) {
        print("clubImg: \(clubImg)")

        let resizedImage = clubImg.resizeImage(image: clubImg, newWidth: 300)
        MainAPIService.shared.postClub(companyNo: companyNo, clubNm: clubNm, clubDesc: clubDesc, clubImg: resizedImage)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("[API] registerClub ERROR : \(err)")
                case .finished:
                    print("[API] registerClub Finish")
                }
            } receiveValue: { (value: String) in
                if value == "BAD_REQUEST" {
                    self.registerClubFailure = true
                    self.registerClubFailureMessage = "회사가 존재하지 않습니다."
                } else if value == "CONFLICT" {
                    self.registerClubFailure = true
                    self.registerClubFailureMessage = "이미 사용중인 동호회명입니다."
                } else if value == "OK" {
                    self.registerClubSuccess = true
                } else {
                    self.registerClubFailure = true
                    self.registerClubFailureMessage = "알 수 없는 오류가 발생하였습니다."
                }
            }.store(in: &subscriptions)
    }
}
