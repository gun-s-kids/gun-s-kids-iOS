//
//  ClubDetailViewModel.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/03/26.
//

import Foundation
import Combine
import Alamofire

class ClubDetailViewModel: ObservableObject {
    var subscriptions = Set<AnyCancellable>()
    
    
    init(clubNo: Int)
        {
            print(#fileID,#function, #line, "")
        }
    
}
