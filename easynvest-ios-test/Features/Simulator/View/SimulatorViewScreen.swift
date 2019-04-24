//
//  SimulatorViewScreen.swift
//  easynvest-ios-test
//
//  Created by Jonatha Lima on 23/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class SimulatorViewScreen: UIView {
    
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
        return simulatorInputView
    }()
    
    private lazy var maturityInputView: SimulatorInputView = {
        let simulatorInputView =
            SimulatorInputView(title: "Qual a data de vencimento do investimento? *",
                               placeholder: "dia/mês/ano")
        return simulatorInputView
    }()
    
    private lazy var CDIPercentageInputView: SimulatorInputView = {
        let simulatorInputView =
            SimulatorInputView(title: "Qual o percentual do CDI do investimento? *",
                               placeholder: "100%")
        return simulatorInputView
    }()
    
    private lazy var simulateButton: PrettyButton = {
        let button = PrettyButton(backgroundColor: .lightGray)
        button.setTitle("Simular", for: .normal)
        button.addTarget(self,
                         action: #selector(simulateButtonPressed),
                         for: .touchUpInside)
        
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        buildViewCode()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func simulateButtonPressed() {
        simulateAction?()
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
    
}
