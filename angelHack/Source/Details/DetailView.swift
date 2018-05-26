//
//  DetailView.swift
//  angelHack
//
//  Created by alvin joseph valdez on 26/05/2018.
//  Copyright © 2018 alvin joseph valdez. All rights reserved.
//

import UIKit
import SnapKit

class DetailView: HeroView {
    
    public let reportButton: UIButton = {
        let view: UIButton = UIButton()
        view.setTitle("Report", for: UIControlState.normal)
        view.setTitleColor(UIColor.black, for: UIControlState.normal)
        view.backgroundColor = UIColor.yellow
        return view
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.lightGray
        
        self.rpd.subviews(forAutoLayout: [self.reportButton])
        
        self.reportButton.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.width.equalToSuperview()
            make.height.equalTo(100)
            make.bottom.equalToSuperview()
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
