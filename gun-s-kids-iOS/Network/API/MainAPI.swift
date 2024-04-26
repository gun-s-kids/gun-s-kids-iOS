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
    case postClubSubmit
    case postClubApproval
    case getClubRequestMembers
    case postClub
    case getMemberList
    case getClubMemberCheck
    case getMyClubPostList
    case clubPost
    case comment
    
    var url: URL{
        switch self {
        case .getCompanyList: return URL(string: "https://server-gunskids.koyeb.app/api/v1/company/list")!
        case .getClubList: return URL(string: "https://server-gunskids.koyeb.app/api/v1/club/list")!
        case .getAllClubList: return URL(string: "https://server-gunskids.koyeb.app/api/v1/club/list/all")!
        case .getClubPostList: return URL(string: "https://server-gunskids.koyeb.app/api/v1/clubPost/list")!
        case .getClubInfo: return URL(string: "https://server-gunskids.koyeb.app/api/v1/club/info")!
        case .postClubSubmit: return URL(string: "https://server-gunskids.koyeb.app/api/v1/club/submit")!
        case .postClubApproval: return URL(string: "https://server-gunskids.koyeb.app/api/v1/club/approval")!
        case .getClubRequestMembers: return URL(string: "https://server-gunskids.koyeb.app/api/v1/club/request-members")!
        case .postClub: return URL(string: "https://server-gunskids.koyeb.app/api/v1/club")!
        case .getMemberList: return URL(string: "https://server-gunskids.koyeb.app/api/v1/club/member-list")!
        case .getClubMemberCheck: return URL(string: "https://server-gunskids.koyeb.app/api/v1/club/club-member-check")!
        case .getMyClubPostList: return URL(string: "https://server-gunskids.koyeb.app/api/v1/clubPost/myclub-post-list")!
        case .clubPost: return URL(string: "https://server-gunskids.koyeb.app/api/v1/clubPost")!
        case .comment: return URL(string: "https://server-gunskids.koyeb.app/api/v1/comment")!
        }
    }
}
