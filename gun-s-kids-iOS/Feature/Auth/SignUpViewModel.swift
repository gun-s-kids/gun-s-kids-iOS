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
    var authInfo: AuthInfoVO?

    init()
        {
            print(#fileID,#function, #line, "")
        }

    func signUp() {
        // TODO: 회원가입 API 호출
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
