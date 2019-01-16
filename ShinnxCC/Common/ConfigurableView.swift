//
//  ConfigurableView.swift
//  ShinnxCC
//
//  Created by Nasir Mahmood on 14.01.19.
//  Copyright © 2019 shinnxstudios. All rights reserved.
//

import Foundation
import UIKit

protocol ConfigurableView: class {
    associatedtype Item
    func configure(_ value:Item)
}
