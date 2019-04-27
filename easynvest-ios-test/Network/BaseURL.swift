//
//  BaseURL.swift
//  easynvest-ios-test
//
//  Created by Jonatha Lima on 27/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Foundation

public struct BaseURL {
    
    static let shared = BaseURL()
    
    public var url: URLComponents
    
    private init() {
        url = URLComponents()
        url.scheme = "https"
        url.host = "api-simulator-calc.easynvest.com.br"
    }
    
}
