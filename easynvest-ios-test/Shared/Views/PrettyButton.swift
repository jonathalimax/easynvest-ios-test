//
//  PrettyButton.swift
//  easynvest-ios-test
//
//  Created by Jonatha Lima on 23/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import SnapKit
import UIKit

public class PrettyButton: UIButton {
    
    private let loaderView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.hidesWhenStopped = true
        return activityIndicatorView
    }()
    
    public var cornerRadius: CGFloat? {
        didSet {
            self.layer.cornerRadius = cornerRadius ?? 0
        }
    }
    
    init(backgroundColor: UIColor = .clear) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        setupButton()
        buildViewCode()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.25,
                           delay: 0,
                           options: [.beginFromCurrentState, .allowUserInteraction],
                           animations: {
                            
                self.alpha = self.isHighlighted ? 0.5 : 1
            }, completion: nil)
        }
    }
    
}

public extension PrettyButton {
    
    func startLoading() {
        loaderView.startAnimating()
        self.titleLabel?.alpha = 0
        self.isUserInteractionEnabled = false
    }
    
    func stopLoading() {
        loaderView.stopAnimating()
        self.titleLabel?.alpha = 1
        self.isUserInteractionEnabled = true
    }
    
}

private extension PrettyButton {
    
    func setupButton() {
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }
    
}

extension PrettyButton: ViewCoding {
    
    public func insertViews() {
        addSubview(loaderView)
    }
    
    public func setupConstraints() {
        loaderView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
}
