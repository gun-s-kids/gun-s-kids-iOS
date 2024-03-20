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
    
    var url: URL{
        switch self {
        case .postSignUp: return URL(string: "https://server-gunskids.koyeb.app/api/v1/members/signup")!
        case .postSignIn: return URL(string: "https://server-gunskids.koyeb.app/api/v1/members/login")!
        case .postSendEmailAuthCode: return URL(string: "https://server-gunskids.koyeb.app/api/v1/members/emails/send-authcode")!
        case .getEmailVerification: return URL(string: "https://server-gunskids.koyeb.app/api/v1/members/emails/verifications")!
        case .getCheckNickname: return URL(string: "https://server-gunskids.koyeb.app/api/v1/members/check-duplicated-nickname")!
        }
    }
}
