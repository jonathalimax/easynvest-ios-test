//
//  SimulatorViewControllerDelegate.swift
//  easynvest-ios-test
//
//  Created by jonatha.pereira.lima on 24/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

protocol SimulatorViewControllerDelegate: AnyObject {
    func simulatorViewController(_ viewController: SimulatorViewController,
                                 didSuccessfully simulation: SimulationResponse)
}
