//
//  CompanyNetwork.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/01/11.
//

import Alamofire
import Combine

class CompanyRepository {
    let url = "https://server-gunskids.koyeb.app/api/v1/company/list"
    let api = CompanyAPI()
    let decoder = JSONDecoder()
    
    func getCompanyListData(completion: @escaping (NetworkResult<Any>) -> Void) {
        guard let url = api.getCompanyListComponents().url else { return }
        
        AF.request(url, method: .get)
            .validate(statusCode: 200..<500)
            .responseDecodable(of: CompanyListResponse.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data.data))
                case .failure:
                    completion(.networkFail)
                }
        }
    }
}
