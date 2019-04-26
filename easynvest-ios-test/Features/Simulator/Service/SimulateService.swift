//
//  SimulateAPI.swift
//  easynvest-ios-test
//
//  Created by jonatha.pereira.lima on 26/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Alamofire

public struct SimulateService {
    
    func get(params: Simulation, completion: @escaping (SimulationResult?) -> Void) {
        
        guard let url =
            URL(string: "https://api-simulator-calc.easynvest.com.br/calculator/simulate") else {
                completion(nil)
                return
        }
        
        Alamofire.request(url,
                          method: .get,
                          parameters: params)
            .validate()
            .responseJSON { response in
                
                guard response.result.isSuccess else {
                    completion(nil)
                    return
                }
                
                print(response)
                
        }
        
    }
    
}
