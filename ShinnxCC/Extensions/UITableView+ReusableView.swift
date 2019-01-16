//
//  UITableView+ReusableView.swift
//  ShinnxCC
//
//  Created by Nasir Mahmood on 14.01.19.
//  Copyright © 2019 shinnxstudios. All rights reserved.
//

import UIKit

extension UITableView {
    
    /// Register Cell of a Type confirming to ResuableView and NibLoadableView
    ///
    /// - Parameter _: Cell Type
    func register<T: UITableViewCell>(_:T.Type) where T: ResuableView, T: NibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    
    /// Register Cell
    ///
    /// - Parameter _: UITableVIewCell which confirms to ReusableView
    func register<T: UITableViewCell>(_:T.Type) where T: ResuableView {
        register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    /// Dequeue Reusable Cell
    /// If not able to cast will run `fatalError`
    ///
    /// - Parameter indexPath: The indexPath for which need to be dequeue
    /// - Returns: ReusableView
    func dequeueReusableCell<T: UITableViewCell>(for indexPath:IndexPath) -> T where T: ResuableView {
        guard let cell =
            dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier,for: indexPath) as? T else {
                fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        
        return cell
    }
    
    
    /// Dequeue Reusable Cell
    /// If not able to cast will run `fatalError`
    ///
    /// - Returns: ReusableView
    func dequeueReusableCell<T: UITableViewCell>() -> T where T: ResuableView {
        guard let cell =
            dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier) as? T else {
                fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        
        return cell
    }
}
