//
//  ReportCell.swift
//  angelHack
//
//  Created by alvin joseph valdez on 27/05/2018.
//  Copyright © 2018 alvin joseph valdez. All rights reserved.
//

import Foundation

import UIKit
import SnapKit
import Kio

public final class DetailCell: UICollectionViewCell {
    
    // MARK: Subviews
    public let cellLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "Sample Label"
        return view
    }()
    
//    public let cellImageView: UIImageView = {
//        let view: UIImageView = UIImageView()
//        view.image = #imageLiteral(resourceName: "lto")
//        return view
//    }()
    
    
    // MARK: Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        self.rpd.subviews(forAutoLayout: [self.cellLabel])
        
        self.cellLabel.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview().offset(20.0)
            make.centerX.equalToSuperview()
        }
        
//        self.cellImageView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
//            make.height.equalTo(150)
//            make.width.equalTo(150)
//            make.centerX.equalToSuperview()
//            make.top.equalTo(self.cellLabel.snp.bottom).offset(20.0)
//        }
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public static var identifier: String {
        return "\(type(of: DetailCell.self))"
    }
    
    public func configure(model: Report) {
        self.cellLabel.text = model.description
    }
}
