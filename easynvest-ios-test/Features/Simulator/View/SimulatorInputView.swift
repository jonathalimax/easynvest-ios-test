//
//  SimulatorInputView.swift
//  easynvest-ios-test
//
//  Created by Jonatha Lima on 23/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

protocol SimulatorInputViewDelegate: AnyObject {
    func simulatorInputView(_ simulatorInputView: SimulatorInputView,
                            textField: UITextField,
                            didCompleteTyping text: String)
}

public class SimulatorInputView: UIView {
    
    weak var delegate: SimulatorInputViewDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .gray
        label.font = .boldSystemFont(ofSize: 13)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var answerTextField: UITextField = {
        let textView = UITextField()
        textView.textColor = .gray
        textView.textAlignment = .center
        textView.font = .systemFont(ofSize: 24)
        return textView
    }()
    
    private lazy var bottomLineView: UIView = {
        let view = UIView()
        let white: CGFloat = 0
        let alpha: CGFloat = 0.1
        view.backgroundColor =
            UIColor(white: white,
                    alpha: alpha)
        return view
    }()
    
    init(title: String,
         placeholder: String? = nil,
         type: SimulatorInputType = .text) {
        
        super.init(frame: .zero)
        buildViewCode()
        titleLabel.text = title
        answerTextField.text = placeholder
        
        switch type {
        case .text:
            answerTextField.keyboardType = .default
        case .numeric:
            answerTextField.keyboardType = .numberPad
        }
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SimulatorInputView: ViewCoding {
    
    public func insertViews() {
        self.addSubview(titleLabel)
        self.addSubview(answerTextField)
        self.addSubview(bottomLineView)
    }
    
    public func setupConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview()
            make.right.equalToSuperview().inset(16)
        }
        
        answerTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalTo(titleLabel.snp.bottom)
            make.right.equalToSuperview().inset(16)
            make.height.greaterThanOrEqualTo(50)
        }
        
        bottomLineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.left.right.equalToSuperview()
            make.top.equalTo(answerTextField.snp.bottom)
            make.bottom.equalToSuperview()
        }
        
    }
    
    public func setupViews() {
        titleLabel.text = "titleLabel"
        answerTextField.text = "answerTextView"
        answerTextField.autocorrectionType = .no
        answerTextField.delegate = self
    }
    
}

extension SimulatorInputView: UITextFieldDelegate {
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.textColor == .gray {
            textField.text = nil
            textField.textColor = .black
        }
    }

    public func textFieldDidEndEditing(_ textField: UITextField,
                                       reason: UITextField.DidEndEditingReason) {
        
        if let text = textField.text, !text.isEmpty {
            delegate?.simulatorInputView(self,
                                         textField: textField,
                                         didCompleteTyping: text)
        }
        
    }
    
}
