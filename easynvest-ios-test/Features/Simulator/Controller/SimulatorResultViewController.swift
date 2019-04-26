//
//  SimulatorResultViewController.swift
//  easynvest-ios-test
//
//  Created by Jonatha Lima on 23/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class SimulatorResultViewController: UIViewController {
    
    private var simulatorResultViewScreen: SimulatorResultViewScreen
    private let sectionsAmount: Int
    
    init() {
        simulatorResultViewScreen = SimulatorResultViewScreen()
        sectionsAmount = 4
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        self.view = simulatorResultViewScreen
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Simulador"
    }
    
}

extension SimulatorResultViewController: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsAmount
    }
    
    public func tableView(_ tableView: UITableView,
                          numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return 0
        case 2:
            return 0
        case 3:
            return 0
        default:
            return 0
        }
    }
    
    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? SimulatorResultHeaderView {
                //cell.resultViewModel = SimulatorResultViewModel(simulation: )
                return cell
            }
            
        default:
            break
        }
        
        fatalError("The section index not found")
    }
    
}
