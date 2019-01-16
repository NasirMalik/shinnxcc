//
//  POITarget.swift
//  ShinnxCC
//
//  Created by Nasir Mahmood on 14.01.19.
//  Copyright © 2019 shinnxstudios. All rights reserved.
//

import Foundation
import Moya

enum POITarget {
    case fetchPOI(parameters: [String: Any])
}

extension POITarget: TargetType {
    var baseURL: URL {
        return URL(string: "https://www.getyourguide.com/")!
    }
    
    var path: String {
        return "/berlin-l17/tempelhof-2-hour-airport-history-tour-berlin-airlift-more-t23776/reviews.json"
    }
    var method: Moya.Method { return .get}
    var sampleData: Data { return Data() }
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
