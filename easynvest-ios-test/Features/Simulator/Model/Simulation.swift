//
//  Simulation.swift
//  easynvest-ios-test
//
//  Created by jonatha.pereira.lima on 24/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import CoreGraphics

struct Simulation {
    
    let input: SimulationInput
    let result: String
    
}

struct SimulationInput: Codable {
    
    let investedAmount: String
    let maturityDate: String
    let index: String
    let rate: Int = 123
    let isTaxFree: Bool = false
    
}

struct SimulationResult: Codable {
    
    let grossAmount: Double
    let grossAmountProfit: Double
    let taxesAmount: Double
    let taxesRate: Double
    let netAmount: Double
    let monthlyGrossRateProfit: Double
    let rateProfit: Double
    let investmentParameter: SimulationResultParameter
    
}

struct SimulationResultParameter: Codable {
    
    let investedAmount: Double
    let maturityDate: String
    let maturityTotalDays: Int
    let rate: Double
    let annualGrossRateProfit: Double
    
}
