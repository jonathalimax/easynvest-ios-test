//
//  SimulatorItemViewSpec.swift
//  easynvest-ios-testTests
//
//  Created by jonatha.pereira.lima on 26/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import easynvest_ios_test

class SimulatorItemViewSpec: QuickSpec {
    
    override func spec() {
        var sut: SimulatorItemView!
        
        describe("SimulatorItemView") {
            beforeEach {
                sut = SimulatorItemView()
                sut.frame = CGRect(x: 0, y: 0, width: 320, height: 30)
                sut.configure(data:
                    .init(title: "Title goes over here",
                          description: "And desciption here"))
            }
            
            context("when presenting on screen") {
                
                it("must render properly") {
                    
                    expect(sut).to(haveValidSnapshot(named: "SimulatorResultHeaderView"))
                    
                }
                
            }
            
        }
        
    }
    
}

