//
//  UIStoryboard+ViewController.swift
//  ShinnxCC
//
//  Created by Nasir Mahmood on 14.01.19.
//  Copyright © 2019 shinnxstudios. All rights reserved.
//

import UIKit

extension UIStoryboard {
    class var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    func controller<T: UIViewController>(type: T.Type) -> T? where T: IdentifiableViewController {
        return instantiateViewController(withIdentifier: T.controllerIdentifier) as? T
    }
}
