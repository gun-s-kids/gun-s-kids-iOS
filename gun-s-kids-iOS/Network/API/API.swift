//
//  CompanyAPI.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/01/11.
//

import Foundation

enum API{
    case getCompanyList
    
    var url: URL{
        switch self {
        case .getCompanyList: return URL(string: "https://server-gunskids.koyeb.app/api/v1/company/list")!
        }
    }
}
