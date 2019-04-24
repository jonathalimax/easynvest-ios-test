//
//  AppCoordinator.swift
//  easynvest-ios-test
//
//  Created by Jonatha Lima on 23/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class AppCoordinator: Coordinator {
    
    private var navigation: UINavigationController
    private var childCoordinators: [Coordinator] = []
    
    init(rootViewController: UINavigationController) {
        navigation = rootViewController
    }
    
    public func start() {
        startSimuator()
    }
    
}

extension AppCoordinator {
    
    func startSimuator() {
        let simulatorCoordinator = SimulatorCoordinator(rootViewController: self.navigation)
        simulatorCoordinator.start()
        childCoordinators.append(simulatorCoordinator)
    }
    
}
