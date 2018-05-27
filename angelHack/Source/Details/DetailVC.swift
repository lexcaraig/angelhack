//
//  DetailVC.swift
//  angelHack
//
//  Created by alvin joseph valdez on 26/05/2018.
//  Copyright © 2018 alvin joseph valdez. All rights reserved.
//

import UIKit
import Kio
import FirebaseDatabase

class DetailVC: JAViewController {
    
    // MARK: Delegate Properties
    private unowned let delegate: DetailVCDelegate
    
    public init(delegate: DetailVCDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        self.view = DetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ref = Database.database().reference(withPath: "reports")
        
        var reportsData: [Report] = [Report]()
        ref.observe(.value, with: { snapshot in
            reportsData.removeAll()
            let dataDict = snapshot.value as! [String : Any]
            let snapData = dataDict["lto"] as! [String: AnyObject]
            
            for data in snapData {
                reportsData.append(Report(
                    userName: data.value["userName"] as! String,
                    completed: true,
                    attachments: data.value["attachments"] as! String,
                    description: data.value["description"] as! String))
            }
            
            DispatchQueue.main.async {
                self.dataSource = DetailDataSource(reports: reportsData, collectionView: self.collectionView)
                self.collectionView.reloadData()
            }
        })
        
        

        
        self.collectionView.delegate = self
        
        self.setUpTargetActions(with: [
            self.rootView.reportButton: #selector(DetailVC.reportAction),
        ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Stored Properties
    public var dataSource: DetailDataSource!
}

// MARK: - Views
private extension DetailVC {
    unowned var rootView: DetailView { return self.view as! DetailView } // swiftlint:disable:this force_cast
    unowned var collectionView: UICollectionView { return self.rootView.collectionView } // swiftlint:disable:this force_cast
}

// MARK: - Target Actions
private extension DetailVC {
    
    @objc func reportAction() {
        self.delegate.reportTapped()
    }
    
}

// MARK: - FavoritesSectionController Protocols
extension DetailVC: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {        
        let cardHeight: CGFloat = self.rootView.bounds.height / 5
        return CGSize(width: 500.0, height: cardHeight)
    }
}
