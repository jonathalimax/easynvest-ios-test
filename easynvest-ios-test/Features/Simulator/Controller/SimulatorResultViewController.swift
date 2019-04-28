//
//  SimulatorResultViewController.swift
//  easynvest-ios-test
//
//  Created by Jonatha Lima on 23/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class SimulatorResultViewController: UIViewController {
    
    private var simulationViewModel: SimulatorResultViewModel
    private var simulatorResultViewScreen: SimulatorResultViewScreen
    
    init(simulationResponse: SimulationResponse) {
        self.simulationViewModel =
            SimulatorResultViewModel(simulation: simulationResponse)
        self.simulatorResultViewScreen = SimulatorResultViewScreen()
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
        
        simulatorResultViewScreen.resultTableView.dataSource = self
        simulatorResultViewScreen.resultTableView.delegate = self
        
        simulatorResultViewScreen.resultTableView
            .register(SimulatorResultHeaderCell.self,
                      forCellReuseIdentifier: "SimulatorResultHeaderCell")
        
        simulatorResultViewScreen.resultTableView
            .register(SimulatorMainInfoCell.self,
                      forCellReuseIdentifier: "SimulatorMainInfoCell")
        
        simulatorResultViewScreen.resultTableView
            .register(SimulatorOthersInfoCell.self,
                      forCellReuseIdentifier: "SimulatorOthersInfoCell")
    }
    
}

extension SimulatorResultViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView,
                          numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            
            if let cell = tableView
                .dequeueReusableCell(withIdentifier: "SimulatorResultHeaderCell") as? SimulatorResultHeaderCell {
                
                cell.resultViewModel = simulationViewModel
                return cell
            }
            
        case 1:
            
            if let cell = tableView
                .dequeueReusableCell(withIdentifier: "SimulatorMainInfoCell") as? SimulatorMainInfoCell {
                
                cell.resultViewModel = simulationViewModel
                return cell
            }
            
        case 2:
            
            if let cell = tableView
                .dequeueReusableCell(withIdentifier: "SimulatorOthersInfoCell") as? SimulatorOthersInfoCell {
                
                cell.resultViewModel = simulationViewModel
                return cell
            }
            
        default:
            break
        }
        
        fatalError("The section index was not found")
    }

}

extension SimulatorResultViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView,
                          heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 120
        case 1:
            return 160
        case 2:
            return 190
        default:
            return 0
        }
        
    }
    
}
