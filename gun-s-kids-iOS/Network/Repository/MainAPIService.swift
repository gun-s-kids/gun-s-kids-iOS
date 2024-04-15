//
//  CompanyNetwork.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/01/11.
//

import Alamofire
import Combine

class MainAPIService {
    static let shared = MainAPIService()
    let decoder = JSONDecoder()
    var cancellable = Set<AnyCancellable>()

    func getCompanyListData() -> AnyPublisher<[CompanyInfo], Error> {
        return Future() { promise in
            AF.request(MainAPI.getCompanyList.url, method: .get)
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
            AF.request(MainAPI.getClubList.url, method: .get, parameters: parameter)
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
            AF.request(MainAPI.getAllClubList.url, method: .get)
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
        let tokenUtil = TokenUtils()
        let parameter: Parameters = ["clubNo" : "\(clubNo)"]

        return Future() { promise in
            AF.request(MainAPI.getClubPostList.url, method: .get, parameters: parameter, headers: tokenUtil.getAuthorizationHeader())
                .publishDecodable(type: ClubPostListResponse.self)
                .value()
                .sink { completion in
                    switch completion {
                    case .finished:
                        print("getClubPostListData finished")
                    case .failure(let error):
                        print("getClubPostListData error: \(error)")
                        promise(.failure(error))
                    }
                } receiveValue: { result in
                    promise(.success(result.data))
                }
                .store(in: &self.cancellable)
        }
        .eraseToAnyPublisher()
    }
    
    func getClubInfo(clubNo: Int) -> AnyPublisher<ClubInfo, Error> {
        let parameter: Parameters = ["clubNo" : "\(clubNo)"]
        
        return Future() { promise in
            AF.request(MainAPI.getClubInfo.url, method: .get, parameters: parameter)
                .publishDecodable(type: ClubInfoResponse.self)
                .value()
                .sink { completion in
                    switch completion {
                    case .finished:
                        print("getClubInfo finished")
                    case .failure(let error):
                        print("getClubInfo error: \(error)")
                        promise(.failure(error))
                    }
                } receiveValue: { result in
                    promise(.success(result.data))
                }
                .store(in: &self.cancellable)
        }
        .eraseToAnyPublisher()
    }
    
    func postClubSubmit(clubNo: Int, introdution: String) -> AnyPublisher<String, Error> {
        let tokenUtil = TokenUtils()
        let parameter: Parameters = ["clubNo" : "\(clubNo)",
                                     "introduction" : "\(introdution)"]
        return Future() { promise in
            AF.request(MainAPI.postClubSubmit.url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: tokenUtil.getAuthorizationHeader())
                .publishDecodable(type: BaseResponse.self)
                .value()
                .sink { completion in
                    switch completion {
                    case .finished:
                        print("postClubSubmit finished")
                    case .failure(let error):
                        print("postClubSubmit error: \(error)")
                        promise(.failure(error))
                    }
                } receiveValue: { result in
                    promise(.success(result.message))
                }
                .store(in: &self.cancellable)
        }
        .eraseToAnyPublisher()
    }
    
    // 추후 수정 필요
    func postClubApproval(clubNo: Int, memberNo: Int, introdution: String) -> AnyPublisher<ClubInfo, Error> {
        let tokenUtil = TokenUtils()
        let parameter: Parameters = ["clubNo" : "\(clubNo)",
                                     "memberNo" : "\(memberNo)",
                                     "introduction" : "\(introdution)"]
        
        return Future() { promise in
            AF.request(MainAPI.postClubApproval.url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: tokenUtil.getAuthorizationHeader())
                .publishDecodable(type: ClubInfoResponse.self)
                .value()
                .sink { completion in
                    switch completion {
                    case .finished:
                        print("postClubApproval finished")
                    case .failure(let error):
                        print("postClubApproval error: \(error)")
                        promise(.failure(error))
                    }
                } receiveValue: { result in
                    promise(.success(result.data))
                }
                .store(in: &self.cancellable)
        }
        .eraseToAnyPublisher()
    }
    
    
    func getClubRequestMembers(clubNo: Int) -> AnyPublisher<[MemberInfo], Error> {
        let tokenUtil = TokenUtils()
        let parameter: Parameters = ["clubNo" : "\(clubNo)"]
        
        return Future() { promise in
            AF.request(MainAPI.getClubRequestMembers.url, method: .get, parameters: parameter, headers: tokenUtil.getAuthorizationHeader())
                .publishDecodable(type: MemberInfoResponse.self)
                .value()
                .sink { completion in
                    switch completion {
                    case .finished:
                        print("getClubRequestMembers finished")
                    case .failure(let error):
                        print("getClubRequestMembers error: \(error)")
                        promise(.failure(error))
                    }
                } receiveValue: { result in
                    promise(.success(result.data))
                }
                .store(in: &self.cancellable)
        }
        .eraseToAnyPublisher()
    }
    
    func postClub(companyNo: Int, clubNm: String, clubDesc: String, clubImg: Data) -> AnyPublisher<String, Error> {
        let tokenUtil = TokenUtils()
        
        let parameter: [String: Any] = ["companyNo" : "\(companyNo)",
                                     "clubNm" : "\(clubNm)",
                                     "clubDesc" : "\(clubDesc)",
                                     "clubImg" : "\(clubImg)"]
        
        return Future() { promise in
            AF.upload(
                multipartFormData: { multipartFormData in
                    for (key, value) in parameter {
                        if let stringValue = "\(value)".data(using: .utf8) {
                            multipartFormData.append(stringValue, withName: key)
                        }
                    }
                },
                to: MainAPI.postClub.url,
                method: .post,
                headers: tokenUtil.getAuthorizationHeaderAndFormData()
            )
            .publishDecodable(type: BaseResponse.self)
            .value()
            .sink { completion in
                switch completion {
                case .finished:
                    print("postClub finished")
                case .failure(let error):
                    print("postClub error: \(error)")
                    promise(.failure(error))
                }
            } receiveValue: { result in
                promise(.success(result.message))
            }
            .store(in: &self.cancellable)
        }
        .eraseToAnyPublisher()
    }
    
    func getMemberList(clubNo: Int) -> AnyPublisher<[MemberInfo], Error> {
        let tokenUtil = TokenUtils()
        let parameter: Parameters = ["clubNo" : "\(clubNo)"]
        
        return Future() { promise in
            AF.request(MainAPI.getMemberList.url, method: .get, parameters: parameter)
                .publishDecodable(type: MemberInfoResponse.self)
                .value()
                .sink { completion in
                    switch completion {
                    case .finished:
                        print("getMemberList finished")
                    case .failure(let error):
                        print("getMemberList error: \(error)")
                        promise(.failure(error))
                    }
                } receiveValue: { result in
                    promise(.success(result.data))
                }
                .store(in: &self.cancellable)
        }
        .eraseToAnyPublisher()
    }
    
    func getClubMemberCheck(clubNo: Int) -> AnyPublisher<String, Error> {
        let tokenUtil = TokenUtils()
        let parameter: Parameters = ["clubNo" : "\(clubNo)"]
        
        return Future() { promise in
            AF.request(MainAPI.getClubMemberCheck.url, method: .get, parameters: parameter, headers: tokenUtil.getAuthorizationHeader())
                .publishDecodable(type: StringDataResponse.self)
                .value()
                .sink { completion in
                    switch completion {
                    case .finished:
                        print("getClubMemberCheck finished")
                    case .failure(let error):
                        print("getClubMemberCheck error: \(error)")
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
