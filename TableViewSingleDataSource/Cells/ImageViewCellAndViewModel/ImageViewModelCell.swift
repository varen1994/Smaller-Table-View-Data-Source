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
    var imageName = "https://image.shutterstock.com/image-vector/dots-letter-c-logo-design-600w-551769190.jpg"
    var label = "abc\nabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabcabc "
    
    override init() {
        
    }
    
}
