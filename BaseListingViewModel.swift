//
//  BaseViewModel.swift
//  TableViewSingleDataSource
//
//  Created by Varender Singh on 13/05/20.
//  Copyright © 2020 Varender Singh. All rights reserved.
//

import UIKit

open class BaseListingViewModel: NSObject {
   
    public var sectionHeaders = [Int:(UIView,CGFloat)?]()
    public var sectionFooters = [Int:(UIView,CGFloat)?]()
    public var model = [Int:[BaseCellViewModel]]()
    
    public init(model:[Int:[BaseCellViewModel]]?,sectionHeader:[Int:(UIView,CGFloat)?]?,sectionFooter:[Int:(UIView,CGFloat)?]?) {
        self.model = model ?? [:]
        self.sectionHeaders = sectionHeader ?? [:]
        self.sectionFooters = sectionFooter ?? [:]
    }
    
    public func insertFullSectionCells(section:Int, model:[BaseCellViewModel]) {
        self.model[section]  = model
    }
}
