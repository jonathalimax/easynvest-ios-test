//
//  ViewCoding.swift
//  easynvest-ios-test
//
//  Created by Jonatha Lima on 23/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import SnapKit

public protocol ViewCoding {
    
    func buildViewCode()
    func insertViews()
    func setupConstraints()
    func setupViews()
    
}

extension ViewCoding {
    
    public func buildViewCode() {
        insertViews()
        setupConstraints()
        setupViews()
    }
    
    func setupViews() {}
    
}
