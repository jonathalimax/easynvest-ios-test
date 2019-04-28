//
//  KeyboardListener.swift
//  easynvest-ios-test
//
//  Created by Jonatha Lima on 23/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class KeyboardListener: NSObject {
    
    public static let shared = KeyboardListener()
    
    private var delegates: [KeyboardListenerDelegate] = []
    public var keyboardHeight: CGFloat = 0.0
    
    private override init() {
        super.init()
        self.prepare()
    }
    
    public func register(_ delegate: KeyboardListenerDelegate) {
        delegates.append(delegate)
    }
    
    public func remove(_ delegate: KeyboardListenerDelegate) {
        
        if let index = delegates.firstIndex(where: { $0 === delegate }) {
            delegates.remove(at: index)
        }
        
    }
    
    @objc
    private func keyboardWillAppear(notification: Notification) {
        self.keyboardHeight = notification.keyboardHeight
        
        for delegate in delegates {
            delegate.keyboardWillAppear(notification)
        }
    }
    
    @objc
    private func keyboardWillDisappear(notification: Notification) {
        self.keyboardHeight = notification.keyboardHeight
        
        for delegate in delegates {
            delegate.keyboardWillDisappear(notification)
        }
    }
    
    private func prepare() {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillAppear(notification:)),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillDisappear(notification:)),
                                               name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil)
        
    }
    
}
