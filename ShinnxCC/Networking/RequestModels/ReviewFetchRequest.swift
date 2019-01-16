//
//  FetchReviewRequest.swift
//  ShinnxCC
//
//  Created by Nasir Mahmood on 14.01.19.
//  Copyright © 2019 shinnxstudios. All rights reserved.
//

import Foundation

/// For Filter Params
enum Direction : String {
    case ascendinng = "ASC"
    case decending = "DESC"
}

enum SortBy : String {
    case dateOfReview = "date_of_review"
    case rating = "rating"
}

/// A codable to use for Fetching Reviews
struct ReviewFetchRequest: Codable {
    let count : Int
    let page : Int
    let rating : String?
    let direction : String?
    let sortBy : String? = "date_of_review"
}

