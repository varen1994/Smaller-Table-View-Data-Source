//
//  ViewModelForCell.swift
//  TableViewSingleDataSource
//
//  Created by Varender Singh on 13/05/20.
//  Copyright © 2020 Varender Singh. All rights reserved.
//

import UIKit

class ImageViewModelCell: NSObject,BaseCellViewModel {
    
    var reusableCellIdentifier: String  = "ImageViewCellIdentifier"
    var imageName:String
    var label:String
    
     init(imageName:String,label:String) {
        self.imageName = imageName
        self.label = label
    }
    
}
