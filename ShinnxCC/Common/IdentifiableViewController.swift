//
//  IdentifiableViewController.swift
//  ShinnxCC
//
//  Created by Nasir Mahmood on 14.01.19.
//  Copyright © 2019 shinnxstudios. All rights reserved.
//

import UIKit

protocol IdentifiableViewController: class {
    static var controllerIdentifier: String {get}
}

extension IdentifiableViewController where Self: UIViewController {
    static var controllerIdentifier: String {
        return String(describing: self)
    }
}
