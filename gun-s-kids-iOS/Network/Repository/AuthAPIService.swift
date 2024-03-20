//
//  AuthAPIService.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/03/16.
//

import Alamofire
import Combine

class AuthAPIService {
    static let shared = AuthAPIService()
    let decoder = JSONDecoder()
    var cancellable = Set<AnyCancellable>()

    func postSignUpData(email: String, password: String, nickname: String) -> AnyPublisher<Bool, Error> {
        let parameter: Parameters = ["email" : "\(email)",
                                     "pwd" : "\(password)",
                                     "memberNm" : "\(nickname)",
                                     "nickname" : "\(nickname)"]

        return Future() { promise in
            AF.request(AuthAPI.postSignUp.url, method: .post, parameters: parameter)
                .publishDecodable(type: SignUpResponse.self)
                .value()
                .sink { completion in
                    switch completion {
                    case .finished:
                        print("postSignUpData finished")
                    case .failure(let error):
                        print("postSignUpData error: \(error)")
                        promise(.failure(error))
                    }
                } receiveValue: { result in
                    if result.message == "success" {
                        promise(.success(true))
                    } else {
                        promise(.success(false))
                    }
                }
                .store(in: &self.cancellable)
        }
        .eraseToAnyPublisher()
    }
    
    func postSignInData(email: String, password: String) -> AnyPublisher<Tokens, Error> {
        let parameter: Parameters = ["email" : "\(email)", "pwd" : "\(password)"]
        
        return Future() { promise in
            AF.request(AuthAPI.postSignIn.url, method: .post, parameters: parameter, encoding: JSONEncoding.default)
                .publishDecodable(type: LoginResponse.self)
                .value()
                .sink { completion in
                    switch completion {
                    case .finished:
                        print("postSignInData finished")
                    case .failure(let error):
                        print("postSignInData error: \(error)")
                        promise(.failure(error))
                    }
                } receiveValue: { result in
                    promise(.success(result.data))
                }
                .store(in: &self.cancellable)
        }
        .eraseToAnyPublisher()
    }
    
    func postSendEmailAuthCode(email: String) -> AnyPublisher<String, Error> {
        let parameter: Parameters = ["email" : "\(email)"]

        return Future() { promise in
            AF.request(AuthAPI.postSendEmailAuthCode.url, method: .post, parameters: parameter)
                .publishDecodable(type: BaseResponse.self)
                .value()
                .sink { completion in
                    switch completion {
                    case .finished:
                        print("postSendEmailAuthCode finished")
                    case .failure(let error):
                        print("postSendEmailAuthCode error: \(error)")
                        promise(.failure(error))
                    }
                } receiveValue: { result in
                    promise(.success(result.data))
                }
                .store(in: &self.cancellable)
        }
        .eraseToAnyPublisher()
    }
    
    func getEmailVerification(email: String, authCode: String) -> AnyPublisher<String, Error> {
        let parameter: Parameters = ["email" : "\(email)", "authCode" : "\(authCode)"]

        return Future() { promise in
            AF.request(AuthAPI.getEmailVerification.url, method: .get, parameters: parameter)
                .publishDecodable(type: SignUpResponse.self)
                .value()
                .sink { completion in
                    switch completion {
                    case .finished:
                        print("getEmailVerification finished")
                    case .failure(let error):
                        print("getEmailVerification error: \(error)")
                        promise(.failure(error))
                    }
                } receiveValue: { result in
                    promise(.success(result.message))
                }
                .store(in: &self.cancellable)
        }
        .eraseToAnyPublisher()
    }
    
    func getCheckNickname(nickname: String) -> AnyPublisher<String, Error> {
        let parameter: Parameters = ["nickname" : "\(nickname)"]

        return Future() { promise in
            AF.request(AuthAPI.getCheckNickname.url, method: .get, parameters: parameter)
                .publishDecodable(type: SignUpResponse.self)
                .value()
                .sink { completion in
                    switch completion {
                    case .finished:
                        print("getCheckNickname finished")
                    case .failure(let error):
                        print("getCheckNickname error: \(error)")
                        promise(.failure(error))
                    }
                } receiveValue: { result in
                    promise(.success(result.message))
                }
                .store(in: &self.cancellable)
        }
        .eraseToAnyPublisher()
    }
}
