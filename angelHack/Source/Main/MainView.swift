//
//  MainView.swift
//  angelHack
//
//  Created by alvin joseph valdez on 26/05/2018.
//  Copyright © 2018 alvin joseph valdez. All rights reserved.
//

import UIKit
import SnapKit
import Kio

public final class MainView: HeroView {
    
    // MARK: Subviews
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
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.blue
        
        self.rpd.subviews(forAutoLayout: self.collectionView)
        
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
    
    
}
