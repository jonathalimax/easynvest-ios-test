//
//  Simulation+JSON.swift
//  easynvest-ios-testTests
//
//  Created by Jonatha Lima on 29/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Foundation

@testable import easynvest_ios_test

extension SimulationResponse {
    
    static func validResponse() -> SimulationResponse? {
        
        if let response: SimulationResponse = JSONFile.get(named: "SimulationResponse") {
            return response
        }
        
        return nil
    }
    
}
