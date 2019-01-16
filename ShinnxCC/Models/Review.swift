//
//  Review.swift
//  ShinnxCC
//
//  Created by Nasir Mahmood on 14.01.19.
//  Copyright © 2019 shinnxstudios. All rights reserved.
//

import Foundation

struct Review: Codable {
    let id: Int
    let rating: String
    let title: String?
    let message, author: String
    let foreignLanguage: Bool
    let date: String
    let languageCode: String
    let travelerType: String?
    let reviewerName, reviewerCountry: String
    
    enum CodingKeys: String, CodingKey {
        case id = "review_id"
        case rating, title, message, author, foreignLanguage, date
        case languageCode
        case travelerType = "traveler_type"
        case reviewerName, reviewerCountry
    }
}
