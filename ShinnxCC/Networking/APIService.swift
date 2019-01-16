//
//  APIService.swift
//  ShinnxCC
//
//  Created by Nasir Mahmood on 14.01.19.
//  Copyright © 2019 shinnxstudios. All rights reserved.
//

import Foundation
import Moya

protocol APIService {
    func fetchReviews(page: Int,
                      perPage: Int,
                      direction : Direction,
                      onSuccess: @escaping (ReviewResult)->Void,
                      onFailure: @escaping (Error)->Void)
}

class APIServiceImpl: APIService {
    private let provider = MoyaProvider<POITarget>()
    
    func fetchReviews(page: Int,
                      perPage: Int,
                      direction : Direction,
                      onSuccess: @escaping (ReviewResult) -> Void,
                      onFailure: @escaping (Error) -> Void) {
   
        let parameters = ReviewFetchRequest(count: perPage, page: page, rating: nil, direction: direction.rawValue)
        
        provider.request(.fetchPOI(parameters: parameters.dictionary!)) { result in
            switch result {
            case let .success(response):
                do {
                    let resultObj = try JSONDecoder().decode(ReviewResult.self, from: response.data)
                    onSuccess(resultObj)
                } catch let err {
                    onFailure(err)
                }
            case let .failure(error):
                onFailure(error)
            }
        }
    }
}


