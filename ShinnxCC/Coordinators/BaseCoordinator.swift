//
//  BaseCoordinator.swift
//  ShinnxCC
//
//  Created by Nasir Mahmood on 14.01.19.
//  Copyright © 2019 shinnxstudios. All rights reserved.
//

import Foundation

protocol Coordinator : class {
    func start()
}

class BaseCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    
    func start() {
        assertionFailure("Implement this funcion in the child Coordinator")
    }
    
    func addDependency(_ coordinator: Coordinator) {
        //Check any duplicate
        for element in childCoordinators {
            if element === coordinator {return}
        }
        childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinator?) {
        guard
            childCoordinators.isEmpty == false,
            let coordinator = coordinator
            else { return }
        for (index, element) in childCoordinators.enumerated() {
            if element === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func removeAllDependencies() {
        childCoordinators.removeAll()
    }
}
