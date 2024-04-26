//
//  MyBoardListViewModel.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/04/26.
//

import Foundation
import Combine
import Alamofire

class MyBoardListViewModel: ObservableObject {
    var subscriptions = Set<AnyCancellable>()
    
    @Published var boardInfoList = [BoardInfo]()

    init()
        {
            print(#fileID,#function, #line, "")
            self.fetchMyClubPostList()
        }

    func fetchMyClubPostList() {
        MainAPIService.shared.getMyClubPostList()
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("[API] getMyClubPostList ERROR : \(err)")
                case .finished:
                    print("[API] getMyClubPostList Finish")
                }
            } receiveValue: { (value: [BoardInfo]) in
                self.boardInfoList = value
                print(self.boardInfoList)
            }.store(in: &subscriptions)
    }
}
