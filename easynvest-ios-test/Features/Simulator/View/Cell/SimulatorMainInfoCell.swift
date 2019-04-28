//
//  SimulatorMainInfoCell.swift
//  easynvest-ios-test
//
//  Created by Jonatha Lima on 27/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class SimulatorMainInfoCell: UITableViewCell {
    
    var resultViewModel: SimulatorResultViewModel? {
        didSet {
            guard let viewModel = resultViewModel else {
                return
            }
            setupCell(from: viewModel)
        }
    }
    
    private lazy var totalValueView: SimulatorItemView = {
        let itemView = SimulatorItemView()
        return itemView
    }()
    
    private lazy var totalIncomeView: SimulatorItemView = {
        let itemView = SimulatorItemView()
        return itemView
    }()
    
    private lazy var investedAmountView: SimulatorItemView = {
        let itemView = SimulatorItemView()
        return itemView
    }()
    
    private lazy var investmentTaxView: SimulatorItemView = {
        let itemView = SimulatorItemView()
        return itemView
    }()
    
    private lazy var liquidInvestmentView: SimulatorItemView = {
        let itemView = SimulatorItemView()
        return itemView
    }()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewCode()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell(from viewModel: SimulatorResultViewModel) {
        
        totalValueView
            .configure(data: .init(title: "Valor aplicado inicialmente",
                                   description: viewModel.investedAmount))
        
        totalIncomeView
            .configure(data: .init(title: "Valor bruto do investimento",
                                   description: viewModel.totalValue))
        
        investedAmountView
            .configure(data: .init(title: "Valor do investimento",
                                   description: viewModel.totalIncomeValue))
        
        investmentTaxView
            .configure(data: .init(title: "IR sobre o investimento",
                                   description: viewModel.investmentTax))
        
        liquidInvestmentView
            .configure(data: .init(title: "Valor líquido do investimento",
                                   description: viewModel.liquidInvestment))
    }
    
}

extension SimulatorMainInfoCell: ViewCoding {
    
    public func insertViews() {
        addSubview(totalValueView)
        addSubview(totalIncomeView)
        addSubview(investedAmountView)
        addSubview(investmentTaxView)
        addSubview(liquidInvestmentView)
    }
    
    public func setupConstraints() {
        
        totalValueView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
        }

        totalIncomeView.snp.makeConstraints { make in
            make.top.equalTo(totalValueView.snp.bottom)
            make.left.right.equalToSuperview()
        }
        
        investedAmountView.snp.makeConstraints { make in
            make.top.equalTo(totalIncomeView.snp.bottom)
            make.left.right.equalToSuperview()
        }

        investmentTaxView.snp.makeConstraints { make in
            make.top.equalTo(investedAmountView.snp.bottom)
            make.left.right.equalToSuperview()
        }

        liquidInvestmentView.snp.makeConstraints { make in
            make.top.equalTo(investmentTaxView.snp.bottom)
            make.left.right.equalToSuperview()
        }
        
    }
    
}
