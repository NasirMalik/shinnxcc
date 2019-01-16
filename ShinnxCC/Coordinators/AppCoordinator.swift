//
//  AppCoordinator.swift
//  ShinnxCC
//
//  Created by Nasir Mahmood on 14.01.19.
//  Copyright © 2019 shinnxstudios. All rights reserved.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    let window: UIWindow
    let factory: FactoryViewController
    let service: APIService
    let navController = UINavigationController()
    
    init(window: UIWindow,
         factory: FactoryViewController,
         apiService: APIService ) {
        self.window = window
        self.factory = factory
        self.service = apiService
    }
    
    override func start() {
        window.rootViewController = navController
        window.makeKeyAndVisible()
        showReviewsListViewController()
    }
    
    private func showReviewsListViewController() {
        var reviewListViewController = factory.reviewsListViewController(apiService: service)
        reviewListViewController.onRightBarButtonTap = { [weak self] _ in
            self?.showFiltersAlertController()
        }
        navController.setViewControllers([reviewListViewController], animated: false)
    }
    
    private func showFiltersAlertController() {
        let alert = UIAlertController(title: "Wait Please", message: "\nFilter Coming Soon!!\n",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        navController.present(alert, animated: true, completion: nil)

    }
}
