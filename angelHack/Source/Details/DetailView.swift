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
    
    public let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let view: UICollectionView = UICollectionView(
            frame: CGRect.zero,
            collectionViewLayout: layout
        )
        
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = UIColor.clear
        view.isUserInteractionEnabled = true
        return view
    }()
    
    public let reportButton: UIButton = {
        let view: UIButton = UIButton()
        view.setTitle("+", for: UIControlState.normal)
        view.setTitleColor(UIColor.black, for: UIControlState.normal)
        view.backgroundColor = UIColor.yellow
        return view
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.lightGray
        
        self.rpd.subviews(forAutoLayout: [self.reportButton, self.collectionView])
        
        self.bringSubview(toFront: self.reportButton)
        
        self.reportButton.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.width.equalTo(80)
            make.height.equalTo(80)
            make.bottom.equalToSuperview().inset(20.0)
            make.trailing.equalToSuperview().inset(20.0)
        }
        
        self.collectionView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(10.0)
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)        
        self.reportButton.layer.cornerRadius = 40.0
    }
}
