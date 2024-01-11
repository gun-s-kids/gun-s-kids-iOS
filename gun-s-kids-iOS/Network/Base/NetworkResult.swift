//
//  NetworkResult.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/01/11.
//

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case networkFail
}
