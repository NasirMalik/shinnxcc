//
//  ReviewResult.swift
//  ShinnxCC
//
//  Created by Nasir Mahmood on 14.01.19.
//  Copyright © 2019 shinnxstudios. All rights reserved.
//

import Foundation

struct ReviewResult: Codable {    
    let status: Bool
    let totalReviewsComments: Int
    let reviews: [Review]
    
    enum CodingKeys: String, CodingKey {
        case status
        case totalReviewsComments = "total_reviews_comments"
        case reviews = "data"
    }
}
