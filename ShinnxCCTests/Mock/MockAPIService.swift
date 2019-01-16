//
//  APIServiceMock.swift
//  ShinnxCCTests
//
//  Created by Nasir Mahmood on 15.01.19.
//  Copyright © 2019 shinnxstudios. All rights reserved.
//

import Foundation
import Moya
@testable import ShinnxCC

class MockAPIService: APIService {
    
    private var provider = MoyaProvider<MockPOITarget>(stubClosure: MoyaProvider.immediatelyStub)
        
    var numberOfTimesfetchReviews = 0
    
    var forceFailure = false
        
    func fetchReviews(page: Int, perPage: Int, direction: Direction, onSuccess: @escaping (ReviewResult) -> Void, onFailure: @escaping (Error) -> Void) {
        
        let parameters = ReviewFetchRequest(count: perPage, page: page, rating: nil, direction: direction.rawValue)
        
        if forceFailure == true {
            provider = MockAPIService.ErrorStubbingProvider()
        }
        
        provider.request(.fetchPOI(parameters: parameters.dictionary!)) { resultResponse in
            
            self.numberOfTimesfetchReviews += 1
            
            switch resultResponse {
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

extension MockAPIService {
    private static func errorEndpointsClosure(target: MockPOITarget) -> Endpoint {
        let sampleResponseClosure = { () -> EndpointSampleResponse in
            return .networkResponse(500, Data())
        }
        
        let endpoint = Endpoint(url: target.baseURL.absoluteString,
                                sampleResponseClosure: sampleResponseClosure,
                                method: target.method,
                                task:target.task,
                                httpHeaderFields: target.headers)
        return endpoint
    }
    
    fileprivate static func ErrorStubbingProvider() -> MoyaProvider<MockPOITarget> {
        return MoyaProvider<MockPOITarget>(endpointClosure: errorEndpointsClosure, stubClosure: MoyaProvider.immediatelyStub)
    }
}
