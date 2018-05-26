//
//  ViewController.swift
//  angelHack
//
//  Created by alvin joseph valdez on 26/05/2018.
//  Copyright © 2018 alvin joseph valdez. All rights reserved.
//

import UIKit
import Kio

class MainVC: JAViewController {
    
    // MARK: Delegate Properties
    private unowned let delegate: MainVCDelegate
    
    // MARK: Intializer
    public init(delegate: MainVCDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    // MARK: View controller lifecycle methods
    public override func loadView() {
        self.view = MainView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let agenciesData: [Agencies] = [
            Agencies(name: "LTO", logo: #imageLiteral(resourceName: "lto")),
            Agencies(name: "MMDA", logo: #imageLiteral(resourceName: "mmda")),
            Agencies(name: "LGU", logo: #imageLiteral(resourceName: "lgu"))
        ]
        
        self.dataSource = MainDataSource(agencies: agenciesData, collectionView: self.collectionView)
        self.collectionView.delegate = self
        
        /// Navigation Bar Set up
        self.setUpNavigationItem { [unowned self] (item: UINavigationItem) -> Void in
            item.rightBarButtonItem = self.rootView.logoutButtonItem
            item.rightBarButtonItem?.target = self
            item.rightBarButtonItem?.action = #selector(MainVC.logoutAction)
            
            item.leftBarButtonItem = self.rootView.backButton
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Overridden UIKit Methods
    
    // MARK: Stored Properties
    public var dataSource: MainDataSource!
    
    // MARK: Instance Methods
}

// MARK: - Views
private extension MainVC {
    unowned var rootView: MainView { return self.view as! MainView } // swiftlint:disable:this force_cast
    unowned var collectionView: UICollectionView { return self.rootView.collectionView } // swiftlint:disable:this force_cast
}

// MARK: - Target Action
private extension MainVC {
    
    @objc func logoutAction() {
        print("LOGOUT")
        
        self.delegate.logoutTapped()
    }
}


// MARK: - FavoritesSectionController Protocols
extension MainVC: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cardHeight: CGFloat = self.rootView.bounds.height / 3
        
        return CGSize(width: 500.0, height: cardHeight)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate.selected()
        
        print(" CARD IS CLICKED")
    }
}
