//
//  TokenUtil.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/03/16.
//

import Security
import Alamofire

class TokenUtils {
    
    private let service: String = String(Bundle.main.bundleIdentifier ?? "")

    func create(account: String, value: String) {
         
         let keyChainQuery: NSDictionary = [
             kSecClass : kSecClassGenericPassword,
             kSecAttrService: service,
             kSecAttrAccount: account,
             kSecValueData: value.data(using: .utf8, allowLossyConversion: false)!
         ]
         
         SecItemDelete(keyChainQuery)
         
         let status: OSStatus = SecItemAdd(keyChainQuery, nil)
         assert(status == noErr, "failed to saving Token")
     }
     
     func read(account: String) -> String? {
         let KeyChainQuery: NSDictionary = [
             kSecClass: kSecClassGenericPassword,
             kSecAttrService: service,
             kSecAttrAccount: account,
             kSecReturnData: kCFBooleanTrue ?? true,
             kSecMatchLimit: kSecMatchLimitOne
         ]
         
         var dataTypeRef: AnyObject?
         let status = SecItemCopyMatching(KeyChainQuery, &dataTypeRef)
         
         if status == errSecSuccess {
             let retrievedData = dataTypeRef as! Data
             let value = String(data: retrievedData, encoding: String.Encoding.utf8)
             return value
         } else {
             print("failed to loading, status code = \(status)")
             return nil
         }
     }
     
     func delete(account: String) {
         let keyChainQuery: NSDictionary = [
             kSecClass: kSecClassGenericPassword,
             kSecAttrService: service,
             kSecAttrAccount: account
         ]
         
         let status = SecItemDelete(keyChainQuery)
         assert(status == noErr, "failed to delete the value, status code = \(status)")
     }
     
     func getAuthorizationHeader() -> HTTPHeaders? {
         if let accessToken = self.read(account: "accessToken") {
             return ["Authorization" : "Bearer \(accessToken)"] as HTTPHeaders
         } else {
             return nil
         }
     }
}
