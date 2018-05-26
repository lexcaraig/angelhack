//
//  ViewController.swift
//  angelHack
//
//  Created by alvin joseph valdez on 26/05/2018.
//  Copyright © 2018 alvin joseph valdez. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    // MARK: Intializer
    public init() {
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
        
        self.dataSource = MainDataSource(collectionView: self.collectionView)
        self.collectionView.delegate = self
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


// MARK: - FavoritesSectionController Protocols
extension MainVC: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cardHeight: CGFloat = self.rootView.bounds.height / 3
        
        return CGSize(width: 500.0, height: cardHeight)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let viewModel: FavoriteViewModel = self.dataSource.viewModels[indexPath.item]
//        self.delegate.selected(poi: viewModel.model)
        
        print(" CARD IS CLICKED")
    }
    
}
