//
//  SignUpViewModel.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/03/16.
//

import Foundation
import Combine
import Alamofire

class SignUpViewModel: ObservableObject {
    var subscriptions = Set<AnyCancellable>()
    @Published var signUpSuccess: Bool = false
    var authInfo: AuthInfoVO?

    init()
        {
            print(#fileID,#function, #line, "")
        }

    func signUp() {
        let email = authInfo?.email ?? ""
        let password = authInfo?.password ?? ""
        let nickname = authInfo?.nickname ?? ""
        
        // TODO: 회원가입 API 호출
        AuthAPIService.shared.postSignUpData(email: email, password: password, nickname: nickname)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("[API] postSignUp ERROR : \(err)")
                case .finished:
                    print("[API] postSignUp Finish")
                }
            } receiveValue: { (value: Bool) in
                if value {
                    self.signUpSuccess = true
                } else {
                    self.signUpSuccess = false
                }
            }.store(in: &subscriptions)
    }
    
    func authEmail(email: String) {
        // TODO: 이메일 인증 API 호출
    }
    
    func authCode(code: String) {
        // TODO: 이메일 인증 API 호출
    }
    
    func validateNickname(nickname: String) {
        // TODO: 닉네임 검증 API 호출
    }
    
    func setValidateEmail(email: String) {
        self.authInfo = AuthInfoVO(email: email)
    }
    
    func setPassword(password: String) {
        self.authInfo?.password = password
    }
    
    func setNickname(nickname: String) {
        self.authInfo?.nickname = nickname
    }
}
