//
//  LabelCellViewModel.swift
//  TableViewSingleDataSource
//
//  Created by Varender Singh on 13/05/20.
//  Copyright © 2020 Varender Singh. All rights reserved.
//

import UIKit

protocol LabelCellProtocol:NSObject {
    func clickedOnButton()
}

class LabelCellViewModel: NSObject,BaseCellViewModel {
    
    var delegate:LabelCellProtocol?
    var reusableCellIdentifier: String = "LabelCellIdentifier"
    var label = "Click on the button to Review"
    
    init(_ delegate:LabelCellProtocol?) {
        self.delegate = delegate
    }
    
    func clickedOnButton() {
        self.delegate?.clickedOnButton()
    }
}
