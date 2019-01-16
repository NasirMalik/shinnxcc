//
//  String+Flag.swift
//  ShinnxCC
//
//  Created by Nasir Mahmood on 16.01.19.
//  Copyright © 2019 shinnxstudios. All rights reserved.
//

import Foundation

extension Locale {
    static func countryflag(from countryCode:String) -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in countryCode.uppercased().unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return s
    }
    
}
