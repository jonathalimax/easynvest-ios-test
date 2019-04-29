//
//  JSON.swift
//  easynvest-ios-testTests
//
//  Created by Jonatha Lima on 29/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Foundation

class JSONFile {
    
    static func get<T: Decodable>(named: String) -> T? {
        
        if let path = Bundle.main.path(forResource: named, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let response = try JSONDecoder().decode(T.self, from: data)
                return response
                
            } catch {
                return nil
            }
        }
        
        return nil
    }
    
}
