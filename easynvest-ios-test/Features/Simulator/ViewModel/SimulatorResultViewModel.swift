//
//  SimulatorResultViewModel.swift
//  easynvest-ios-test
//
//  Created by jonatha.pereira.lima on 24/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Foundation

public class SimulatorResultViewModel {
    
    let totalValue: String
    let totalIncomeValue: String
    let investedAmount: String
    let investmentTax: String
    let liquidInvestment: String
    let maturityDate: String
    let maturityTotalDays: String
    let monthlyIncome: String
    let CDIRate: String
    let annualReturn: String
    let rateProfit: String
    
    init(simulation: SimulationResponse) {
        totalValue = "R$ \(simulation.grossAmount)"
        totalIncomeValue = "R$ \(simulation.grossAmountProfit)"
        investedAmount = "R$ \(simulation.investmentParameter.investedAmount)"
        investmentTax = "R$ \(simulation.taxesAmount)(\(simulation.taxesRate)%)"
        liquidInvestment = "R$ \(simulation.netAmount)"
        maturityDate = "\(simulation.investmentParameter.maturityDate)"
        maturityTotalDays = "\(simulation.investmentParameter.maturityTotalDays)"
        monthlyIncome = "\(simulation.monthlyGrossRateProfit)%"
        CDIRate = "\(simulation.investmentParameter.rate)%"
        annualReturn = "\(simulation.annualGrossRateProfit)%"
        rateProfit = "\(simulation.rateProfit)%"
    }
    
}
