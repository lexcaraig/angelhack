//
//  ReportDataSource.swift
//  angelHack
//
//  Created by alvin joseph valdez on 27/05/2018.
//  Copyright © 2018 alvin joseph valdez. All rights reserved.
//

import UIKit

class DetailDataSource: HeroObject {
    
    // MARK: Initializer
    public init(reports: [Report], collectionView: UICollectionView) {
        self.model = reports
        self.collectionView = collectionView
        super.init()
        self.collectionView.register(DetailCell.self, forCellWithReuseIdentifier: DetailCell.identifier)
        self.collectionView.dataSource = self
        
        print(reports)
    }
    
    // MARK: Stored Properties
    private unowned let collectionView: UICollectionView
    private let model: [Report]
}


// MARK: - UICollectionViewDataSource Protocol
extension DetailDataSource: UICollectionViewDataSource {
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.model.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: DetailCell.identifier, for: indexPath) as? DetailCell
            else {
                fatalError("Not a valid Cell")
        }
        
        cell.configure(model: self.model[indexPath.row])
        
        return cell
    }
    
}
