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
    @Published var boardDetailInfo: BoardDetailInfo?
    @Published var isFetchedData: Bool = false


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
    
    func fetchMyClubPostDetail(postNo: Int) {
        MainAPIService.shared.getClubPost(postNo: postNo)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("[API] getClubPost ERROR : \(err)")
                case .finished:
                    print("[API] getClubPost Finish")
                }
            } receiveValue: { (value: BoardDetailInfo) in
                self.boardDetailInfo = value
                self.isFetchedData = true
                print(value)
            }.store(in: &subscriptions)
    }
    
    func setDefaultBoardDetailInfo(_ boardInfo: BoardInfo) -> BoardDetailInfo {
        return BoardDetailInfo(postNo: boardInfo.postNo,
                        nickname: boardInfo.nickname,
                        companyNm: boardInfo.companyNm,
                        postTitle: boardInfo.postTitle,
                        postContent: boardInfo.postContent,
                        createdDate: boardInfo.createdDate,
                        likeCnt: boardInfo.likeCnt,
                        isLike: false,
                        commentCount: boardInfo.commentCount,
                        postImg: boardInfo.postImg,
                        commentList: [])
    }
}
