//
//  SimulatorViewController.swift
//  easynvest-ios-test
//
//  Created by Jonatha Lima on 23/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class SimulatorViewController: UIViewController {
    
    weak var delegate: SimulatorViewControllerDelegate?
    
    private var simulatorViewScreen: SimulatorViewScreen
    private var simulateService: SimulateService
    
    init(simulateService: SimulateService = SimulateService()) {
        self.simulatorViewScreen = SimulatorViewScreen()
        self.simulateService = simulateService
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        self.view = simulatorViewScreen
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Simulador"
        
        navigationItem.backBarButtonItem =
            UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
        
        simulatorViewScreen.simulateAction = {
            self.fetchSimulation(self.simulatorViewScreen.simulation)
        }
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        KeyboardListener.shared.register(self)
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        KeyboardListener.shared.remove(self)
    }
    
}

private extension SimulatorViewController {
    
    func fetchSimulation(_ simulation: Simulation) {
        
        simulateService.get(simulation: simulation,
                            completion: { [weak self] result in
            
            guard let sSelf = self, let result = result else {
                return
            }
            sSelf.delegate?.simulatorViewController(sSelf,
                                                    didSuccessfully: result)
        })
        
    }
    
}

extension SimulatorViewController: KeyboardListenerDelegate {
    
    public func keyboardWillAppear(_ notification: Notification) {
        // TODO: Implement solution
    }
    
    public func keyboardWillDisappear(_ notification: Notification) {
        // TODO: Implement solution
    }
    
}
