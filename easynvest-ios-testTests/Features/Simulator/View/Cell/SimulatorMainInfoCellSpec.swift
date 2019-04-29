//
//  SimulatorMainInfoCellSpec.swift
//  easynvest-ios-testTests
//
//  Created by Jonatha Lima on 29/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import easynvest_ios_test

class SimulatorMainInfoCellSpec: QuickSpec {
    
    override func spec() {
        var sut: SimulatorMainInfoCell!
        
        describe("SimulatorMainInfoCell") {
            beforeEach {
                sut = SimulatorMainInfoCell()
                sut.frame = CGRect(x: 0, y: 0, width: 320, height: 150)
                
                if let response = SimulationResponse.validResponse() {
                    sut.resultViewModel =
                        SimulatorResultViewModel(simulation: response)
                }
            }
            
            context("when presenting on screen") {
                
                it("must render properly") {
                    
                    expect(sut).to(haveValidSnapshot(named: "SimulatorMainInfoCell"))
                    
                }
                
            }
            
        }
        
    }
    
}
