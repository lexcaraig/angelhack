//
//  ReportCoordinator.swift
//  angelHack
//
//  Created by alvin joseph valdez on 26/05/2018.
//  Copyright © 2018 alvin joseph valdez. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage

public final class ReportCoordinator: AbstractCoordinator {
    
    // MARK: Delegate Properties
    //    private unowned let delegate: MainCoordinatorDelegate
    
    // MARK: Initializers
    public init(navigationController: UINavigationController) {
        //        self.delegate = delegate
        self.navigationController = navigationController
        super.init()
    }
    
    // MARK: Stored Properties
    private let navigationController: UINavigationController
    private var vc: ReportVC!
    let imagePicker: UIImagePickerController = UIImagePickerController()
    var imagePathURL: URL!
    
    // MARK: Instance Methods
    public override func start() {
        super.start()
        let vc: ReportVC = ReportVC(delegate: self)
        self.vc = vc
        self.navigationController.present(vc, animated: true, completion: nil)
    }
}

extension ReportCoordinator: ReportVCDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            let url: URL = (info[UIImagePickerControllerImageURL] as? URL)!
            
            self.vc.rootView.attachmentPreview.contentMode = .scaleAspectFit
            self.vc.rootView.attachmentPreview.image = pickedImage
            self.imagePicker.dismiss(animated: true, completion: nil)
            
            self.imagePathURL = url
        }
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.imagePicker.dismiss(animated: true, completion: nil)
    }
    
    public func attachmentTapped() {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.delegate = self
        
        
        self.vc.present(imagePicker, animated: true, completion: nil)
    }
    
    public func closeTapped() {
        self.remove(childCoordinator: self)
        vc.dismiss(animated: true, completion: nil)
    }
    
    public func sendReport() {
        let image: UIImage = self.vc.rootView.attachmentPreview.image!
        let imageData: NSData = UIImageJPEGRepresentation(image, 0.8)! as NSData
        
        let storage = Storage.storage()
        let storageRef = storage.reference()
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        let starsRef = storageRef.child("images")
        
        starsRef.putData(imageData as Data, metadata: metadata) { (metaData, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }else{
                //store downloadURL
                starsRef.downloadURL(completion: { (url: URL?, error: Error?) -> Void in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        
                        let childRef = Database.database().reference(withPath: "reports")
                        
                        let reportItem: Report = Report(
                            userName: "sample",
                            completed: false,
                            attachments: "\(String(describing: url!))",
                            description: self.vc.rootView.descriptionTextView.text
                        )
                        childRef.child("lto").child(UUID().uuidString).setValue(reportItem.toAnyObject())
                        
//                        self.remove(childCoordinator: self)
                        self.vc.dismiss(animated: true, completion: nil)
                    }
                })
            }
        }
        
    }
}
