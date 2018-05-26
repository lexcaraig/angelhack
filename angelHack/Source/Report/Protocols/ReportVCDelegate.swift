//
//  ReportVCDelegate.swift
//  angelHack
//
//  Created by alvin joseph valdez on 26/05/2018.
//  Copyright © 2018 alvin joseph valdez. All rights reserved.
//

import Foundation

public protocol ReportVCDelegate: class {
    func closeTapped()
    
    func attachmentTapped()
    
    func sendReport()
}
