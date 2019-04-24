//
//  SimulatorViewModel.swift
//  easynvest-ios-test
//
//  Created by jonatha.pereira.lima on 24/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Foundation

typealias SimulatorItemsCellConfigurator =
    TableCellConfigurator<SimulatorItemsCell, SimulatorItemsCell.Item>

public class SimulatorViewModel {
    
    let items: [CellConfigurator] = [
        SimulatorItemsCellConfigurator(item:
            .init(title: "Test", description: "Test"))
    ]
    
}
