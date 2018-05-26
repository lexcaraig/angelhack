//
//  MainDataSource.swift
//  angelHack
//
//  Created by alvin joseph valdez on 26/05/2018.
//  Copyright © 2018 alvin joseph valdez. All rights reserved.
//

import UIKit

class MainDataSource: HeroObject {
    
    // MARK: Initializer
    public init(agencies: [Agencies], collectionView: UICollectionView) {
        self.model = agencies
        self.collectionView = collectionView
        super.init()
        self.collectionView.register(MainCell.self, forCellWithReuseIdentifier: MainCell.identifier)
        self.collectionView.dataSource = self
    }
    
    // MARK: Stored Properties
    private unowned let collectionView: UICollectionView
    private let model: [Agencies]
}


// MARK: - UICollectionViewDataSource Protocol
extension MainDataSource: UICollectionViewDataSource {
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.model.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: MainCell.identifier, for: indexPath) as? MainCell
            else {
                fatalError("Not a valid Cell")
        }
        
        cell.configure(model: self.model[indexPath.row])
        
        return cell
    }
    
}
