//
//  CompanyAPI.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/01/11.
//

import Foundation

enum MainAPI{
    case getCompanyList
    case getClubList
    case getAllClubList
    case getClubPostList
    case getClubInfo
    
    var url: URL{
        switch self {
        case .getCompanyList: return URL(string: "https://server-gunskids.koyeb.app/api/v1/company/list")!
        case .getClubList: return URL(string: "https://server-gunskids.koyeb.app/api/v1/club/list")!
        case .getAllClubList: return URL(string: "https://server-gunskids.koyeb.app/api/v1/club/list/all")!
        case .getClubPostList: return URL(string: "https://server-gunskids.koyeb.app/api/v1/clubPost/list")!
        case .getClubInfo: return URL(string: "https://server-gunskids.koyeb.app/api/v1/club/info")!
        }
    }
}
