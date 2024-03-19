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
    
    func getEmailAuthData(email: String) -> AnyPublisher<[Club], Error> {
        return Future() { promise in
            AF.request(AuthAPI.getEmailAuth(email: email).url, method: .get)
                .publishDecodable(type: ClubListResponse.self)
                .value()
                .sink { completion in
                    switch completion {
                    case .finished:
                        print("getAllClubListData finished")
                    case .failure(let error):
                        print("getAllClubListData error: \(error)")
                        promise(.failure(error))
                    }
                } receiveValue: { result in
                    promise(.success(result.data))
                }
                .store(in: &self.cancellable)
        }
        .eraseToAnyPublisher()
    }
}
