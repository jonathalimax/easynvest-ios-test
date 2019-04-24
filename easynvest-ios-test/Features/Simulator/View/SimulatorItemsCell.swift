//
//  SimulatorItemsCell.swift
//  easynvest-ios-test
//
//  Created by jonatha.pereira.lima on 24/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

class SimulatorItemsCell: UITableViewCell, ConfigurableCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    func configure(data: Item) {
        titleLabel.text = data.title
        descriptionLabel.text = data.description
    }
    
}

extension SimulatorItemsCell {
    
    struct Item {
        let title: String
        let description: String
    }
    
}
