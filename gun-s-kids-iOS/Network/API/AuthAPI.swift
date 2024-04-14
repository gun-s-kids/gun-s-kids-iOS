//
//  AuthAPI.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/03/16.
//

import Foundation

enum AuthAPI {
    case postSignUp
    case postSignIn
    case postSendEmailAuthCode
    case getEmailVerification
    case getCheckNickname
    case patchProfileUpdate
    case getProfile
    case deleteAuth
    case postRefresh
    
    var url: URL{
        switch self {
        case .postSignUp: return URL(string: "https://server-gunskids.koyeb.app/api/v1/members/signup")!
        case .postSignIn: return URL(string: "https://server-gunskids.koyeb.app/api/v1/auth/login")!
        case .postSendEmailAuthCode: return URL(string: "https://server-gunskids.koyeb.app/api/v1/members/emails/send-authcode")!
        case .getEmailVerification: return URL(string: "https://server-gunskids.koyeb.app/api/v1/members/emails/verifications")!
        case .getCheckNickname: return URL(string: "https://server-gunskids.koyeb.app/api/v1/members/check-duplicated-nickname")!
        case .patchProfileUpdate: return URL(string: "https://server-gunskids.koyeb.app/api/v1/members/profile-update")!
        case .getProfile: return URL(string: "https://server-gunskids.koyeb.app/api/v1/members/profile")!
        case .deleteAuth: return URL(string: "https://server-gunskids.koyeb.app/api/v1/auth")!
        case .postRefresh: return URL(string: "https://server-gunskids.koyeb.app/api/v1/auth/refresh")!
        }
    }
}
