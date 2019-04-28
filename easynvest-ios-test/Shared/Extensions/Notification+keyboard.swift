//
//  Notification+keyboard.swift
//  easynvest-ios-test
//
//  Created by Jonatha Lima on 23/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

extension Notification {
    
    var keyboardHeight: CGFloat {
        
        guard let userInfo = self.userInfo else {
            return .leastNormalMagnitude
        }
        
        guard let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue else {
            fatalError("The UIKeyboardFrameBeginUserInfoKey from keyboard cannot cast to NSValue")
        }
        
        let frame = keyboardFrame.cgRectValue
        return frame.height
        
    }
    
}
