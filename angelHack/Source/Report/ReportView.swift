//
//  ReportView.swift
//  angelHack
//
//  Created by alvin joseph valdez on 26/05/2018.
//  Copyright © 2018 alvin joseph valdez. All rights reserved.
//

import UIKit
import SnapKit

class ReportView: HeroView {
    
    public let closeButton: UIButton = {
        let view: UIButton = UIButton()
        view.setTitle("close", for: UIControlState.normal)
        view.setTitleColor(UIColor.black, for: UIControlState.normal)
        return view
    }()    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.lightGray
        
        self.rpd.subviews(forAutoLayout: [self.closeButton])
        
        self.closeButton.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalTo(10.0)
            make.trailing.equalToSuperview().inset(20.0)
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
