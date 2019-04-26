//
//  SimulatorItemView.swift
//  easynvest-ios-test
//
//  Created by jonatha.pereira.lima on 24/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

class SimulatorItemView: UITableViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewCode()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SimulatorItemView: ViewCoding {
  
    func insertViews() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(6)
            make.top.bottom.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel.snp.right).offset(6)
            make.top.bottom.equalToSuperview()
            make.right.equalToSuperview().inset(6)
        }
    }
    
    func setupViews() {
        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        descriptionLabel.setContentHuggingPriority(.required, for: .vertical)
    }
    
}

extension SimulatorItemView {
    
    struct Data {
        let title: String
        let description: String
    }
    
    func configure(data: Data) {
        titleLabel.text = data.title
        descriptionLabel.text = data.description
    }
    
}
