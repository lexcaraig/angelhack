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
    
    public let attachmentButton: UIButton = {
        let view: UIButton = UIButton()
        view.setTitle("Add Attachment", for: UIControlState.normal)
        view.setTitleColor(UIColor.black, for: UIControlState.normal)
        return view
    }()
    
    public let sendReportButton: UIButton = {
        let view: UIButton = UIButton()
        view.setTitle("Send Report", for: UIControlState.normal)
        view.setTitleColor(UIColor.black, for: UIControlState.normal)
        return view
    }()
    
    public let attachmentPreview: UIImageView = {
        let view: UIImageView = UIImageView()
        view.image = #imageLiteral(resourceName: "lto")
        return view
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.lightGray
        
        self.rpd.subviews(forAutoLayout: [
                self.closeButton, self.attachmentButton,
                self.attachmentPreview, self.sendReportButton
            ]
        )
        
        self.closeButton.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalTo(10.0)
            make.trailing.equalToSuperview().inset(20.0)
        }
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let attackmentButtonWidth: Float = Float(self.frame.size.width / 2)
        
        self.attachmentPreview.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.bottom.equalTo(self.attachmentButton.snp.top)
            make.centerX.equalToSuperview()
            make.width.equalTo(100.0)
            make.height.equalTo(100.0)
        }
        
        self.attachmentButton.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.bottom.equalTo(self.sendReportButton.snp.top)
            make.height.equalTo(50.0)
            make.width.equalTo(attackmentButtonWidth)
            make.centerX.equalToSuperview()
        }
        
        self.sendReportButton.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.bottom.equalToSuperview().inset(20.0)
            make.height.equalTo(50.0)
            make.width.equalTo(attackmentButtonWidth)
            make.centerX.equalToSuperview()
        }
    }
}
