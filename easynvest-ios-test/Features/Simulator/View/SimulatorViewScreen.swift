//
//  SimulatorViewScreen.swift
//  easynvest-ios-test
//
//  Created by Jonatha Lima on 23/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class SimulatorViewScreen: UIView {
    
    public var simulation: Simulation
    public var simulateAction: (() -> Void)?
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 40
        return stackView
    }()
    
    private lazy var moneyInputView: SimulatorInputView = {
        let simulatorInputView =
            SimulatorInputView(title: "Quanto você gostaria de aplicar? *",
                               placeholder: "R$",
                               type: .numeric)
        simulatorInputView.delegate = self
        return simulatorInputView
    }()
    
    private lazy var maturityInputView: SimulatorInputView = {
        let simulatorInputView =
            SimulatorInputView(title: "Qual a data de vencimento do investimento? *",
                               placeholder: "dia/mês/ano")
        simulatorInputView.delegate = self
        return simulatorInputView
    }()
    
    private lazy var CDIPercentageInputView: SimulatorInputView = {
        let simulatorInputView =
            SimulatorInputView(title: "Qual o percentual do CDI do investimento? *",
                               placeholder: "100%")
        simulatorInputView.delegate = self
        return simulatorInputView
    }()
    
    public lazy var simulateButton: PrettyButton = {
        let button = PrettyButton(backgroundColor: .lightGray)
        button.setTitle("Simular", for: .normal)
        button.addTarget(self,
                         action: #selector(simulateButtonPressed),
                         for: .touchUpInside)
        
        return button
    }()
    
    init() {
        simulation = Simulation()
        super.init(frame: .zero)
        buildViewCode()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func simulateButtonPressed() {
        self.endEditing(true)
        simulateAction?()
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>,
                                      with event: UIEvent?) {
        super.endEditing(true)
    }
    
}

extension SimulatorViewScreen: ViewCoding {
    
    public func insertViews() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(moneyInputView)
        stackView.addArrangedSubview(maturityInputView)
        stackView.addArrangedSubview(CDIPercentageInputView)
        stackView.addArrangedSubview(simulateButton)
    }
    
    public func setupConstraints() {
        
        simulateButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().inset(30)
        }
        
    }
    
    public func setupViews() {
        self.backgroundColor = .red
        simulateButton.cornerRadius = 25
    }
    
    public func hasValidEntries() -> Bool {
        
        if simulation.investedAmount.isEmpty ||
            simulation.rate == 0 ||
            simulation.maturityDate.isEmpty {
            
            return false
        }
        
        return true
    }
    
    func keyboard(shouldAppear: Bool, _ notification: Notification) {
        
        let keyboardFrame = shouldAppear ?
            notification.keyboardHeight / 3 : 0
        
        self.stackView.snp.updateConstraints({ update in
            update.centerY.equalToSuperview().offset(-keyboardFrame)
        })
        
        self.layoutIfNeeded()
        
    }
    
}

extension SimulatorViewScreen: SimulatorInputViewDelegate {
    
    func simulatorInputView(_ simulatorInputView: SimulatorInputView,
                            textField: UITextField,
                            didCompleteTyping text: String) {
        
        switch simulatorInputView {
        case self.moneyInputView:
            simulation.investedAmount = text
        case self.maturityInputView:
            simulation.maturityDate = text
        case self.CDIPercentageInputView:
            if let rate = Int(text) {
                simulation.rate = rate
            }
        default:
            break
        }
    }
    
}
