//
//  BoardListViewModel.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/03/03.
//

import Foundation
import Combine
import Alamofire

class BoardListViewModel: ObservableObject {
    var subscriptions = Set<AnyCancellable>()
    var localCacheBoard = Dictionary<Int, [BoardInfo]>()
    
    @Published var boardInfoList = [BoardInfo]()
    @Published var clubNo: Int?

    init(clubNo: Int)
        {
            print(#fileID,#function, #line, "")
            self.fetchClubPostList(clubNo: clubNo)
        }

    func fetchClubPostList(clubNo: Int) {
        if localCacheBoard[clubNo] == nil {
            APIService.shared.getClubPostListData(clubNo: clubNo)
                .sink { completion in
                    switch completion {
                    case .failure(let err):
                        print("[API] getClubPostList ERROR : \(err)")
                    case .finished:
                        print("[API] getClubPostList Finish")
                    }
                } receiveValue: { (value: [BoardInfo]) in
                    self.boardInfoList = value
                    self.localCacheBoard[clubNo] = value
                    print(self.boardInfoList)
                }.store(in: &subscriptions)
        } else {
            self.boardInfoList = localCacheBoard[clubNo] ?? []
        }
    }
}
