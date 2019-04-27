//
//  SimulationResponse.swift
//  easynvest-ios-test
//
//  Created by Jonatha Lima on 27/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Foundation

struct SimulationResponse: Codable {
    
    let grossAmount: Double
    let grossAmountProfit: Double
    let taxesAmount: Double
    let taxesRate: Double
    let netAmount: Double
    let monthlyGrossRateProfit: Double
    let rateProfit: Double
    let annualGrossRateProfit: Double
    let investmentParameter: SimulationParameter
    
}

struct SimulationParameter: Codable {
    
    let investedAmount: Double
    let maturityDate: String
    let maturityTotalDays: Int
    let rate: Double
    
}
