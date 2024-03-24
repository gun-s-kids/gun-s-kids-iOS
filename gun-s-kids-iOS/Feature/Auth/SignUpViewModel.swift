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
    @Published var signUpFailure: Bool = false
    @Published var sendEmailCodeSuccess: Bool = false
    @Published var sendEmailCodeFailure: Bool = false
    @Published var validateAuthCodeSuccess: Bool = false
    @Published var validateAuthCodeFailure: Bool = false
    @Published var validateNicknameSuccess: Bool = false
    @Published var validateNicknameFailure: Bool = false
    @Published var validatePasswordSuccess: Bool = false
    @Published var validatePasswordFailure: Bool = false
    @Published var companyInfoList = [CompanyInfo]()
    
    var authInfo: AuthInfoVO?

    init()
        {
            print(#fileID,#function, #line, "")
            fetchCompanyList()
        }

    func signUp() {
        let email = authInfo?.email ?? ""
        let password = authInfo?.password ?? ""
        let nickname = authInfo?.nickname ?? ""
        let companyNo = authInfo?.companyNo ?? 0
        
        print("AUTH INFO: E:\(email) P:\(password) N:\(nickname) C: \(companyNo)")

        
        // TODO: 회원가입 API 호출
        AuthAPIService.shared.postSignUpData(email: email, password: password, nickname: nickname, companyNo: companyNo)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("[API] postSignUp ERROR : \(err)")
                    self.signUpFailure = true
                case .finished:
                    print("[API] postSignUp Finish")
                }
            } receiveValue: { (value: Bool) in
                if value {
                    self.signUpSuccess = true
                } else {
                    self.signUpFailure = true
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
                    self.sendEmailCodeFailure = true
                case .finished:
                    print("[API] postSendEmailAuthCode Finish")
                }
            } receiveValue: { (value: String) in
                print("[API] postSendEmailAuthCode \(value)")
                self.sendEmailCodeSuccess = true
                self.setValidateEmail(email: email)
            }.store(in: &self.subscriptions)
    }
    
    func validateAuthCode(authCode: String) {
        // TODO: 이메일 인증코드 검증 API 호출
        let email = authInfo?.email ?? ""

        AuthAPIService.shared.getEmailVerification(email: email, authCode: authCode)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("[API] getEmailVerification ERROR : \(err)")
                    self.validateAuthCodeFailure = true
                case .finished:
                    print("[API] getEmailVerification Finish")
                }
            } receiveValue: { (value: String) in
                print("[API] getEmailVerification \(value)")
                self.validateAuthCodeSuccess = true
            }.store(in: &subscriptions)
    }
    
    func validateNickname(nickname: String) {
        // TODO: 닉네임 검증 API 호출
        AuthAPIService.shared.getCheckNickname(nickname: nickname)
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("[API] getCheckNickname ERROR : \(err)")
                    self.validateNicknameFailure = true
                case .finished:
                    print("[API] getCheckNickname Finish")
                }
            } receiveValue: { (value: String) in
                print("[API] getCheckNickname \(value)")
                self.validateNicknameSuccess = true
                self.setNickname(nickname: nickname)
            }.store(in: &subscriptions)
    }
    
    func fetchCompanyList() {
        MainAPIService.shared.getCompanyListData()
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("[API] getCompanyList ERROR : \(err)")
                case .finished:
                    print("[API] getCompanyList Finish")
                }
            } receiveValue: { (value: [CompanyInfo]) in
                self.companyInfoList = value
                print(self.companyInfoList)
            }.store(in: &subscriptions)
    }
    
    
    func validatePassword(password: String, confirmPassword: String) {
        // TODO: 닉네임 검증 API 호출
        if password == confirmPassword {
            validatePasswordSuccess = true
            setPassword(password: password)
        } else {
            validatePasswordFailure = true
        }
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
    
    func setCompanyNo(index: Int) {
        self.authInfo?.companyNo = index
    }
}
