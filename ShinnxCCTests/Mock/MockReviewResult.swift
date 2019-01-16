//
//  MockReview.swift
//  ShinnxCCTests
//
//  Created by Nasir Mahmood on 15.01.19.
//  Copyright © 2019 shinnxstudios. All rights reserved.
//

import Foundation
@testable import ShinnxCC

extension ReviewResult {
    
    static func mockJSONData() throws -> Data {
        return mockJSONString().data(using: .utf8)!
    }
    
    private static func mockJSONString() -> String {
        return "{\"status\":true,\"total_reviews_comments\":637,\"data\":[{\"review_id\":4763613,\"rating\":\"5.0\",\"title\":\"\",\"message\":\"Sehr spannende und unterhaltsame F\\u00fchrung! Die zwei Stunden vergingen wie im Flug (h\\u00f6h\\u00f6) und unser Guide Lars war super!!\",\"author\":\"Dorothee \\u2013 Germany\",\"foreignLanguage\":true,\"date\":\"January 15, 2019\",\"date_unformatted\":{},\"languageCode\":\"de\",\"traveler_type\":\"friends\",\"reviewerName\":\"Dorothee\",\"reviewerCountry\":\"Germany\"}]}"
    }
}


