//
//  SimulatorCoordinator.swift
//  easynvest-ios-test
//
//  Created by Jonatha Lima on 23/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class SimulatorCoordinator: Coordinator {
    
    private var navigationController: UINavigationController
    private var controller: SimulatorViewController
    
    init(rootViewController: UINavigationController) {
        self.navigationController = rootViewController
        self.controller = SimulatorViewController()
    }
    
    public func start() {
        controller.view.backgroundColor = .white
        controller.delegate = self
        self.navigationController.viewControllers = [controller]
    }
    
    private func startSimulatorResult(simulationResponse: SimulationResponse) {
        let simulatorResultViewController =
            SimulatorResultViewController(simulationResponse: simulationResponse)
        
        navigationController.pushViewController(simulatorResultViewController,
                                                animated: true)
    }
    
}

extension SimulatorCoordinator: SimulatorViewControllerDelegate {
    func simulatorViewController(_ viewController: SimulatorViewController,
                                 didSuccessfully simulation: SimulationResponse) {
        
        startSimulatorResult(simulationResponse: simulation)
    }
    
}
