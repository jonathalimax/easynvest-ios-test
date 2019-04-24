//
//  KeyboardListenerDelegate.swift
//  easynvest-ios-test
//
//  Created by jonatha.pereira.lima on 24/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Foundation

public protocol KeyboardListenerDelegate: AnyObject {
    func keyboardWillAppear(_ notification: Notification)
    func keyboardWillDisappear(_ notification: Notification)
}
