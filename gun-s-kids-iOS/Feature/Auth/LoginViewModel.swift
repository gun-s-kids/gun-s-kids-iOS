//
//  LoginViewModel.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/03/16.
//

import Foundation
import Combine
import Alamofire

class LoginViewModel: ObservableObject {

    init()
        {
            print(#fileID,#function, #line, "")
        }

    func login(email: String, password: String) {
        // TODO: 로그인 API 호출
    }
}
