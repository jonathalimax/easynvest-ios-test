//
//  JSONFileSpec.swift
//  easynvest-ios-testTests
//
//  Created by Jonatha Lima on 29/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Quick
import Nimble

@testable import easynvest_ios_test

class JSONFileSpec: QuickSpec {
    
    override func spec() {
        
        var sut: SimulationResponse!
        
        describe("JSONFile") {
            
            beforeEach {
                sut = JSONFile.get(named: "SimulationResponse")
            }
            
            context("when get JSON file", {
                
                it("should not be nil", closure: {
                    expect(sut).toNot(beNil())
                })
                
                it("should have the correct type", closure: {
                    expect(sut).to(beAKindOf(SimulationResponse.self))
                })
                
            })
            
            context("when trying to get an inexistent JSON file", {
                
                beforeEach {
                    sut = JSONFile.get(named: "JSONResponse")
                }
                
                it("should be nil", closure: {
                    expect(sut).to(beNil())
                })
                
            })
            
        }
        
    }
    
}
