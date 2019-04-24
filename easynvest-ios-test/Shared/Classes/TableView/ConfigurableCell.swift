//
//  ConfigurableCell.swift
//  easynvest-ios-test
//
//  Created by jonatha.pereira.lima on 24/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Foundation

protocol ConfigurableCell {
    associatedtype DataType
    func configure(data: DataType)
}
