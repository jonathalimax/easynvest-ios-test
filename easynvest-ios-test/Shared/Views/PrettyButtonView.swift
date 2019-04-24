//
//  PrettyButtonView.swift
//  easynvest-ios-test
//
//  Created by Jonatha Lima on 23/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class PrettyButton: UIButton {
    
    public var cornerRadius: CGFloat? {
        didSet {
            self.layer.cornerRadius = cornerRadius ?? 0
        }
    }
    
    init(backgroundColor: UIColor = .clear) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension PrettyButton {
    
    func setupButton() {
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }
    
}
