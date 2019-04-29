//
//  SimulatorResultViewModelSpec.swift
//  easynvest-ios-testTests
//
//  Created by Jonatha Lima on 29/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Quick
import Nimble

@testable import easynvest_ios_test

class SimulatorResultViewModelSpec: QuickSpec {
    
    override func spec() {
        
        var sut: SimulatorResultViewModel!
        var simulationResponse: SimulationResponse!
        
        describe("SimulatorResultViewModel") {
            
            context("when simulation viewModel is setup", {
                
                beforeEach {
                    if let response: SimulationResponse = SimulationResponse.validResponse() {
                        simulationResponse = response
                    }
                    sut = SimulatorResultViewModel(simulation: simulationResponse)
                }
                
                it("should have the correct data", closure: {
                    
                    expect(sut.investedAmount).to(equal("R$ 32323.0"))
                    expect(sut.maturityTotalDays).to(equal("1981"))
                    expect(sut.maturityDate).to(equal("2023-03-03T00:00:00"))
                    expect(sut.rateProfit).to(equal("9.5512%"))
                    expect(sut.totalValue).to(equal("R$ 60528.2"))
                    expect(sut.investmentTax).to(equal("R$ 4230.78(15.0%)"))
                    expect(sut.totalIncomeValue).to(equal("R$ 28205.2"))
                    expect(sut.liquidInvestment).to(equal("R$ 56297.42"))
                    expect(sut.monthlyIncome).to(equal("0.76%"))
                    expect(sut.CDIRate).to(equal("123.0%"))
                    expect(sut.annualReturn).to(equal("87.26%"))
                    
                })
                
            })
            
        }
        
    }
    
}
