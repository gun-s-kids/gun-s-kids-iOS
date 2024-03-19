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
    var subscriptions = Set<AnyCancellable>()
    @Published var loginFailure: Bool = false
    @Published var loginSuccess: Bool = false

    init()
        {
            print(#fileID,#function, #line, "")
        }

    func login(email: String, password: String) {
        // TODO: 로그인 API 호출
        AuthAPIService.shared.postSignInData(email: email, password: password)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    self.loginFailure = true
                    print("[API] postSignInData ERROR : \(err)")
                case .finished:
                    print("[API] postSignInData Finish")
                }
            } receiveValue: { (value: Tokens) in
                print("[API] postSignInData Success")
                let tokenUtil = TokenUtils()
                tokenUtil.create(account: "accessToken", value: value.accessToken)
                tokenUtil.create(account: "refreshToken", value: value.refreshToken)
                self.loginSuccess = true
            }.store(in: &subscriptions)
    }
}
