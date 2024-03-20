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
    
    func sendEmailAuthCode(email: String) {
        // TODO: 이메일 인증코드 전송 API 호출
        AuthAPIService.shared.postSendEmailAuthCode(email: email)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("[API] postSendEmailAuthCode ERROR : \(err)")
                case .finished:
                    print("[API] postSendEmailAuthCode Finish")
                }
            } receiveValue: { (value: String) in
                print("[API] postSendEmailAuthCode \(value)")
                self.setValidateEmail(email: email)
            }.store(in: &subscriptions)
    }
    
    func validateAuthCode(authCode: String) {
        // TODO: 이메일 인증코드 검증 API 호출
        let email = authInfo?.email ?? ""

        AuthAPIService.shared.getEmailVerification(email: email, authCode: authCode)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("[API] getEmailVerification ERROR : \(err)")
                case .finished:
                    print("[API] getEmailVerification Finish")
                }
            } receiveValue: { (value: String) in
                print("[API] getEmailVerification \(value)")
            }.store(in: &subscriptions)
    }
    
    func validateNickname(nickname: String) {
        // TODO: 닉네임 검증 API 호출
        AuthAPIService.shared.getCheckNickname(nickname: nickname)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("[API] getCheckNickname ERROR : \(err)")
                case .finished:
                    print("[API] getCheckNickname Finish")
                }
            } receiveValue: { (value: String) in
                print("[API] getCheckNickname \(value)")
            }.store(in: &subscriptions)
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
