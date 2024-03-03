//
//  CompanyNetwork.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/01/11.
//

import Alamofire
import Combine

class APIService {
    static let shared = APIService()
    let decoder = JSONDecoder()
    var cancellable = Set<AnyCancellable>()

    func getCompanyListData() -> AnyPublisher<[CompanyInfo], Error> {
        return Future() { promise in
            AF.request(API.getCompanyList.url, method: .get)
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
    
    func getClubListData(companyNo: Int) -> AnyPublisher<[Club], Error> {
        let parameter: Parameters = ["companyNo" : "\(companyNo)"]
        
        return Future() { promise in
            AF.request(API.getClubList.url, method: .get, parameters: parameter)
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
    
    func getAllClubListData() -> AnyPublisher<[Club], Error> {
        return Future() { promise in
            AF.request(API.getAllClubList.url, method: .get)
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
    
    func getClubPostListData(clubNo: Int) -> AnyPublisher<[BoardInfo], Error> {
        let parameter: Parameters = ["clubNo" : "\(clubNo)"]

        return Future() { promise in
            AF.request(API.getClubPostList.url, method: .get, parameters: parameter)
                .publishDecodable(type: ClubPostListResponse.self)
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
