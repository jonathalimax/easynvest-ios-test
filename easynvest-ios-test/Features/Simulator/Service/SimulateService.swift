//
//  SimulateAPI.swift
//  easynvest-ios-test
//
//  Created by jonatha.pereira.lima on 26/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Alamofire

public struct SimulateService {
    
    func get(simulation: Simulation, completion: @escaping (SimulationResponse?) -> Void) {
        
        var components = BaseURL.shared.url
        components.path = APIRoute.simulation.rawValue
        
        components.queryItems = [
            URLQueryItem(name: "investedAmount", value: simulation.investedAmount),
            URLQueryItem(name: "index", value: simulation.index),
            URLQueryItem(name: "rate", value: "\(simulation.rate)"),
            URLQueryItem(name: "isTaxFree", value: "\(simulation.isTaxFree)"),
            URLQueryItem(name: "maturityDate", value: simulation.maturityDate)
        ]
        
        guard let url = components.url else {
            completion(nil)
            return
        }
        
        Alamofire.request(url).validate().responseJSON { result in
            let decoder = JSONDecoder()
            
            guard let data = result.data else {
                completion(nil)
                return
            }
            
            do {
                
                let response = try decoder
                    .decode(SimulationResponse.self,
                            from: data)
                
                completion(response)
                
            } catch let err {
                print(err.localizedDescription)
                completion(nil)
            }
            
        }
        
    }
    
}
