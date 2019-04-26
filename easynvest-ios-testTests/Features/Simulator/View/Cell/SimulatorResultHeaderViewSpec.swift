//
//  SimulatorResultHeaderViewSpec.swift
//  easynvest-ios-testTests
//
//  Created by jonatha.pereira.lima on 26/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import easynvest_ios_test

class SimulatorResultHeaderViewSpec: QuickSpec {
    
    override func spec() {
        var sut: SimulatorResultHeaderView!
        
        describe("SimulatorResultHeaderView") {
            beforeEach {
                sut = SimulatorResultHeaderView()
                sut.frame = CGRect(x: 0, y: 0, width: 320, height: 60)
                sut.configure(data:
                    .init(totalValue: "1.088,69",
                          totalIncome: "88,69"))
            }
            
            context("when presenting on screen") {
                
                it("must render properly") {
                    
                    expect(sut).to(haveValidSnapshot(named: "SimulatorResultHeaderView"))
                    
                }
                
            }
            
        }
        
    }
    
}
