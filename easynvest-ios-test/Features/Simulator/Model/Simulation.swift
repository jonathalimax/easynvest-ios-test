//
//  Simulation.swift
//  easynvest-ios-test
//
//  Created by jonatha.pereira.lima on 24/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import CoreGraphics

public class Simulation {
    
    var investedAmount: String
    var maturityDate: String
    var rate: Int
    var index: String
    var isTaxFree: Bool
    
    init() {
        investedAmount = ""
        maturityDate = ""
        rate = 0
        index = "CDI"
        isTaxFree = true
    }
    
}
