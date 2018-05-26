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
//    public let button: UIButton = {
//        let view: UIButton = UIButton(type: UIButtonType.custom)
//        view.setTitle("Share", for: UIControlState.normal)
//        view.setTitleColor(UIColor.blue, for: UIControlState.normal)
//        return view
//    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.black
        
        self.rpd.subviews(forAutoLayout: [])
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
