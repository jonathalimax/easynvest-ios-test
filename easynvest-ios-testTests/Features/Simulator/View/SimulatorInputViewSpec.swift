//
//  SimulatorInputView.swift
//  easynvest-ios-testTests
//
//  Created by Jonatha Lima on 28/04/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import easynvest_ios_test

class SimulatorInputViewSpec: QuickSpec {
    
    var view: UIView!
    var sut: SimulatorInputView!
    
    override func spec() {
        
        describe("SimulatorInputView") {
            
            context("when presenting on screen") {
                
                
                context("and has placeholder", {
                    
                    beforeEach {
                        self.setupViews(data:
                            .init(title: "Title",
                                  placeholder: "Placeholder",
                                  type: .text))
                    }
                    
                    it("must render properly") {
                        expect(self.sut).to(haveValidSnapshot(named: "SimulatorInputView_withPlaceholder"))
                    }
                    
                })
                
                context("and has placeholder", {
                    
                    beforeEach {
                        self.setupViews(data:
                            .init(title: "Title",
                                  placeholder: nil,
                                  type: .text))
                    }
                    
                    it("must render properly") {
                        expect(self.sut).to(haveValidSnapshot(named: "SimulatorInputView_withoutPlaceholder"))
                    }
                    
                })
                
            }
            
        }
        
    }
    
}

private extension SimulatorInputViewSpec {
    
    func setupViews(data: Data) {
        view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 320, height: 70)
        
        sut = SimulatorInputView(title: data.title,
                                 placeholder: data.placeholder,
                                 type: data.type)
        
        view.addSubview(sut)
        sut.snp.makeConstraints({ make in
            make.left.top.right.equalToSuperview()
        })
    }
    
    struct Data {
        var title: String
        var placeholder: String?
        var type: SimulatorInputType
    }
    
}

