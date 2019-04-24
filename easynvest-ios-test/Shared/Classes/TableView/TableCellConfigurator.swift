//
//  TableCellConfigurator.swift
//  easynvest-ios-test
//
//  Created by jonatha.pereira.lima on 24/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

class TableCellConfigurator<CellType: ConfigurableCell, DataType>: CellConfigurator
                                where CellType.DataType == DataType, CellType: UITableViewCell {
    
    static var reuseId: String { return String(describing: CellType.self) }
    
    let item: DataType
    
    init(item: DataType) {
        self.item = item
    }
    
    func configure(cell: UIView) {
        if let cell = cell as? CellType {
            cell.configure(data: item)
        }
    }
}
