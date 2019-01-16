//
//  ResuableView.swift
//  ShinnxCC
//
//  Created by Nasir Mahmood on 14.01.19.
//  Copyright © 2019 shinnxstudios. All rights reserved.
//

import UIKit

protocol ResuableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ResuableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

