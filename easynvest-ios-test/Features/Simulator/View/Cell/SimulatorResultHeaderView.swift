//
//  SimulatorResultHeaderView.swift
//  easynvest-ios-test
//
//  Created by jonatha.pereira.lima on 26/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class SimulatorResultHeaderView: UITableViewCell {
    
    var resultViewModel: SimulatorResultViewModel? {
        didSet {
            totalValueLabel.text = resultViewModel?.totalValue
            totalIncomeLabel.text = resultViewModel?.totalIncomeValue
        }
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.text = "Resultado da simulação"
        return label
    }()
    
    private lazy var totalValueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private lazy var totalIncomeStack: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 2
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private lazy var totalIncomeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.text = "Rendimento total de"
        return label
    }()
    
    private lazy var totalIncomeValueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12)
        label.textColor = .green
        return label
    }()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewCode()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SimulatorResultHeaderView: ViewCoding {
    
    public func insertViews() {
        addSubview(titleLabel)
        addSubview(totalValueLabel)
        addSubview(totalIncomeStack)
        totalIncomeStack.addArrangedSubview(totalIncomeLabel)
        totalIncomeStack.addArrangedSubview(totalIncomeValueLabel)
    }
    
    public func setupConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
        }
        
        totalValueLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.left.right.equalToSuperview()
        }
        
        totalIncomeStack.snp.makeConstraints { make in
            make.top.equalTo(totalValueLabel.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
}

extension SimulatorResultHeaderView {
    
    struct Data {
        var totalValue: String
        var totalIncome: String
    }
    
    func configure(data: Data) {
        totalValueLabel.text = "R$ \(data.totalValue)"
        totalIncomeValueLabel.text = "R$ \(data.totalIncome)"
    }
    
}
