//
//  SimulatorResultViewScreen.swift
//  easynvest-ios-test
//
//  Created by Jonatha Lima on 23/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class SimulatorResultViewScreen: UIView {
    
    public lazy var resultTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        buildViewCode()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SimulatorResultViewScreen: ViewCoding {
    
    public func insertViews() {
        addSubview(resultTableView)
    }
    
    public func setupConstraints() {
        
        resultTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
}
