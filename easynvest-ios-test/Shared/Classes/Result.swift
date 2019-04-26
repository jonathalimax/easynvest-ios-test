//
//  Result.swift
//  easynvest-ios-test
//
//  Created by jonatha.pereira.lima on 26/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Foundation

public enum Result<T> {
    case success(T)
    case failure(Error)
    
    public func map<Z>(_ transformer: (T) -> Z) -> Result<Z> {
        
        switch self {
            
        case .success(let value):
            return .success(transformer(value))
            
        case .failure(let error):
            return .failure(error)
            
        }
        
    }
    
}
