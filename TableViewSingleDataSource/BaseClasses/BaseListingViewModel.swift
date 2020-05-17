//
//  BaseViewModel.swift
//  TableViewSingleDataSource
//
//  Created by Varender Singh on 13/05/20.
//  Copyright © 2020 Varender Singh. All rights reserved.
//

import UIKit

 class BaseListingViewModel: NSObject {
   
     var sectionHeaders = [Int:(UIView,CGFloat)?]()
     var sectionFooters = [Int:(UIView,CGFloat)?]()
     var model = [Int:[BaseCellViewModel]]()
    
     init(model:[Int:[BaseCellViewModel]]?,sectionHeader:[Int:(UIView,CGFloat)?]?,sectionFooter:[Int:(UIView,CGFloat)?]?) {
        self.model = model ?? [:]
        self.sectionHeaders = sectionHeader ?? [:]
        self.sectionFooters = sectionFooter ?? [:]
    }
    
     func insertFullSectionCells(section:Int, model:[BaseCellViewModel]) {
        self.model[section]  = model
    }
}
