//
//  SimulatorInputView.swift
//  easynvest-ios-test
//
//  Created by Jonatha Lima on 23/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class SimulatorInputView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .gray
        label.font = .boldSystemFont(ofSize: 13)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var answerTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .gray
        textView.textAlignment = .center
        textView.font = .systemFont(ofSize: 24)
        return textView
    }()
    
    private lazy var bottomLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.1)
        return view
    }()
    
    init(title: String,
         placeholder: String? = nil,
         type: SimulatorInputType = .text) {
        
        super.init(frame: .zero)
        buildViewCode()
        titleLabel.text = title
        answerTextView.text = placeholder
        
        switch type {
        case .text:
            answerTextView.keyboardType = .default
        case .numeric:
            answerTextView.keyboardType = .numberPad
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SimulatorInputView: ViewCoding {
    
    public func insertViews() {
        self.addSubview(titleLabel)
        self.addSubview(answerTextView)
        self.addSubview(bottomLineView)
    }
    
    public func setupConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview()
            make.right.equalToSuperview().inset(16)
        }
        
        answerTextView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalTo(titleLabel.snp.bottom)
            make.right.equalToSuperview().inset(16)
            make.height.greaterThanOrEqualTo(50)
        }
        
        bottomLineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.left.right.equalToSuperview()
            make.top.equalTo(answerTextView.snp.bottom)
            make.bottom.equalToSuperview()
        }
        
    }
    
    public func setupViews() {
        titleLabel.text = "titleLabel"
        answerTextView.text = "answerTextView"
        answerTextView.autocorrectionType = .no
        answerTextView.delegate = self
    }
    
}

extension SimulatorInputView: UITextViewDelegate {
    
    public func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .gray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
}
