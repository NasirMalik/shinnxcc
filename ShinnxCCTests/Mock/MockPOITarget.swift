//
//  MockPOITarget.swift
//  ShinnxCCTests
//
//  Created by Nasir Mahmood on 15.01.19.
//  Copyright © 2019 shinnxstudios. All rights reserved.
//

import Foundation
import Moya
@testable import ShinnxCC

enum MockPOITarget {
    case fetchPOI(parameters: [String: Any])
}

extension MockPOITarget: TargetType {
    var baseURL: URL {
        return URL(string: "https://mockUrl.com")!
    }
    
    var path: String {
        return "/"
    }
    
    var method: Moya.Method { return .get}
    
    var sampleData: Data {
        switch self {
        case .fetchPOI(_):
            return try! ReviewResult.mockJSONData()
        }
    }
    
    var task: Task {
        switch self {
        case let .fetchPOI(parameters):
            return Moya.Task.requestParameters(parameters: parameters,
                                               encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
