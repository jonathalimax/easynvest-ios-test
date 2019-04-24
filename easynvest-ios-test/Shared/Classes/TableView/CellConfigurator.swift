//
//  CellConfigurator.swift
//  easynvest-ios-test
//
//  Created by jonatha.pereira.lima on 24/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

protocol CellConfigurator {
    static var reuseId: String { get }
    
    func configure(cell: UIView)
}
