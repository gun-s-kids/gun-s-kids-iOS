//
//  CompanyAPI.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/01/11.
//

import Foundation

struct CompanyAPI {
    static let scheme = "https"
    static let host = "server-gunskids.koyeb.app"
    static let path = "/api/v1/company/list"
    
    func getCompanyListComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = CompanyAPI.scheme
        components.host = CompanyAPI.host
        components.path = CompanyAPI.path
        
        return components
    }
}
