//
//  SimulatorOthersInfoCell.swift
//  easynvest-ios-test
//
//  Created by Jonatha Lima on 27/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class SimulatorOthersInfoCell: UITableViewCell {
    
    var resultViewModel: SimulatorResultViewModel? {
        didSet {
            guard let viewModel = resultViewModel else {
                return
            }
            setupCell(from: viewModel)
        }
    }
    
    private lazy var maturityDateView: SimulatorItemView = {
        let itemView = SimulatorItemView()
        return itemView
    }()
    
    private lazy var maturityTotalDaysView: SimulatorItemView = {
        let itemView = SimulatorItemView()
        return itemView
    }()
    
    private lazy var monthlyIncomeView: SimulatorItemView = {
        let itemView = SimulatorItemView()
        return itemView
    }()
    
    private lazy var CDIRateView: SimulatorItemView = {
        let itemView = SimulatorItemView()
        return itemView
    }()
    
    private lazy var annualReturnView: SimulatorItemView = {
        let itemView = SimulatorItemView()
        return itemView
    }()
    
    private lazy var rateProfitView: SimulatorItemView = {
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
        
        maturityDateView
            .configure(data: .init(title: "Data de resgate",
                                   description: viewModel.maturityDate))
        
        maturityTotalDaysView
            .configure(data: .init(title: "Dias corridos",
                                   description: viewModel.maturityTotalDays))
        
        monthlyIncomeView
            .configure(data: .init(title: "Rendimento mensal",
                                   description: viewModel.monthlyIncome))
        
        CDIRateView
            .configure(data: .init(title: "Percentual do CDI do investimento",
                                   description: viewModel.CDIRate))
        
        annualReturnView
            .configure(data: .init(title: "Rentabilidade anual",
                                   description: viewModel.annualReturn))
        
        rateProfitView
            .configure(data: .init(title: "Rentabilidade no período",
                                   description: viewModel.rateProfit))
    }
    
}

extension SimulatorOthersInfoCell: ViewCoding {
    
    public func insertViews() {
        addSubview(maturityDateView)
        addSubview(maturityTotalDaysView)
        addSubview(monthlyIncomeView)
        addSubview(CDIRateView)
        addSubview(annualReturnView)
        addSubview(rateProfitView)
    }
    
    public func setupConstraints() {
        
        maturityDateView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        
        maturityTotalDaysView.snp.makeConstraints { make in
            make.top.equalTo(maturityDateView.snp.bottom)
            make.left.right.equalToSuperview()
        }
        
        monthlyIncomeView.snp.makeConstraints { make in
            make.top.equalTo(maturityTotalDaysView.snp.bottom)
            make.left.right.equalToSuperview()
        }
        
        CDIRateView.snp.makeConstraints { make in
            make.top.equalTo(monthlyIncomeView.snp.bottom)
            make.left.right.equalToSuperview()
        }
        
        annualReturnView.snp.makeConstraints { make in
            make.top.equalTo(CDIRateView.snp.bottom)
            make.left.right.equalToSuperview()
        }
        
        rateProfitView.snp.makeConstraints { make in
            make.top.equalTo(annualReturnView.snp.bottom)
            make.left.right.equalToSuperview()
        }
        
    }
    
}
