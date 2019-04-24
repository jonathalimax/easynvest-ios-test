//
//  SimulatorViewController.swift
//  easynvest-ios-test
//
//  Created by Jonatha Lima on 23/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class SimulatorViewController: UIViewController {

    private var simulatorViewScreen: SimulatorViewScreen
    public weak var delegate: SimulatorViewControllerDelegate?
    
    init() {
        simulatorViewScreen = SimulatorViewScreen()
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
        simulatorViewScreen.simulateAction = {
            self.delegate?.simulatorViewControllerDidTapSimulate(self)
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

extension SimulatorViewController: KeyboardListenerDelegate {
    
    public func keyboardWillAppear(_ notification: Notification) {
        // TODO: Implement solution
    }
    
    public func keyboardWillDisappear(_ notification: Notification) {
        // TODO: Implement solution
    }
    
}
