//
//  BoardListViewModel.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/03/03.
//

import Foundation
import Combine
import Alamofire
import SwiftUI

class BoardListViewModel: ObservableObject {
    var subscriptions = Set<AnyCancellable>()
    var localCacheBoard = Dictionary<Int, [BoardInfo]>()
    var writingPostUIImages: [UIImage] = []
    
    @Published var boardInfoList = [BoardInfo]()
    @Published var boardDetailInfo: BoardDetailInfo?
    @Published var clubNo: Int?
    @Published var writingPostImages = [PostImageCell]()
    @Published var isPostSuccess: Bool = false
    @Published var isFetchedData: Bool = false

    init(clubNo: Int)
        {
            print(#fileID,#function, #line, "")
            self.fetchClubPostList(clubNo: clubNo)
            self.clubNo = clubNo
        }

    func fetchClubPostList(clubNo: Int) {
        if localCacheBoard[clubNo] == nil {
            MainAPIService.shared.getClubPostListData(clubNo: clubNo)
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
    
    func fetchClubPostDetail(postNo: Int) {
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
    
    func saveClubPost(clubNo: Int, companyNo: Int, postTitle: String, postContent: String) {
        var imageList: [UIImage] = []
        
        for imageCell in writingPostImages {
            imageList.append(imageCell.uiImage)
        }
        
        print("clubNo: \(clubNo), companyNo: \(companyNo), postTitle: \(postTitle), postContent: \(postContent), imageList: \(imageList.count)")
        MainAPIService.shared.postClubPost(clubNo: clubNo, companyNo: companyNo, postTitle: postTitle, postContent: postContent, imageList: imageList)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("[API] postClubPost ERROR : \(err)")
                case .finished:
                    print("[API] postClubPost Finish")
                }
            } receiveValue: { (value: String) in
                print("[API] postClubPost message : \(value)")
                if value == "success" {
                    self.isPostSuccess = true
                } else {
                    self.isPostSuccess = false
                }
            }.store(in: &subscriptions)
    }
    
    func postLike(postNo: Int) {
        MainAPIService.shared.postClubPostLike(postNo: postNo)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("[API] postLike ERROR : \(err)")
                case .finished:
                    print("[API] postLike Finish")
                }
            } receiveValue: { (value: String) in
                print("postLike : \(value)")
            }.store(in: &subscriptions)
        
    }
    
    func loadImages(uiImage: UIImage) {
        DispatchQueue.main.async {
            let resizedImage = uiImage.resizeImage(image: uiImage, newWidth: 300)
            self.writingPostImages.append(PostImageCell(image: Image(uiImage: uiImage), uiImage: resizedImage))
        }
    }
    
    func removeImage(_ image: PostImageCell) {
        if let index = writingPostImages.firstIndex(where: { $0.id == image.id }) {
            writingPostImages.remove(at: index)
        }
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
