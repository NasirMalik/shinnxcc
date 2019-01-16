//
//  FactoryViewController.swift
//  ShinnxCC
//
//  Created by Nasir Mahmood on 14.01.19.
//  Copyright © 2019 shinnxstudios. All rights reserved.
//

import UIKit

protocol FactoryViewController {
    func reviewsListViewController(apiService: APIService) -> UIViewController & ReviewTableViewActions
}

class FactoryViewControllerImpl: FactoryViewController {
    func reviewsListViewController(apiService: APIService) -> UIViewController & ReviewTableViewActions {
        let controller = UIStoryboard.main.controller(type: ReviewsTableViewController.self)!
        controller.viewModel = ReviewsListViewModelImpl(withDelegate: controller, apiService: apiService)
        return controller
    }
    
}
