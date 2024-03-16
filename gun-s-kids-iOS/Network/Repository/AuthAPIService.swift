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

    func postSignUpData() -> AnyPublisher<[CompanyInfo], Error> {
        return Future() { promise in
            AF.request(AuthAPI.postSignUp.url, method: .post)
                .publishDecodable(type: CompanyListResponse.self)
                .value()
                .sink { completion in
                    switch completion {
                    case .finished:
                        print("getCompanyListData finished")
                    case .failure(let error):
                        print("getCompanyListData error: \(error)")
                        promise(.failure(error))
                    }
                } receiveValue: { result in
                    promise(.success(result.data))
                }
                .store(in: &self.cancellable)
        }
        .eraseToAnyPublisher()
    }
    
    func postSignInData(companyNo: Int) -> AnyPublisher<[Club], Error> {
        let parameter: Parameters = ["companyNo" : "\(companyNo)"]
        
        return Future() { promise in
            AF.request(AuthAPI.postSignIn.url, method: .post, parameters: parameter)
                .publishDecodable(type: ClubListResponse.self)
                .value()
                .sink { completion in
                    switch completion {
                    case .finished:
                        print("getClubListData finished")
                    case .failure(let error):
                        print("getClubListData error: \(error)")
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
