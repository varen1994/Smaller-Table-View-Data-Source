//
//  ViewModel.swift
//  TableViewSingleDataSource
//
//  Created by Varender Singh on 17/05/20.
//  Copyright © 2020 Varender Singh. All rights reserved.
//

import UIKit

class ViewModel: NSObject,LabelCellProtocol {
   
    var baseModel:BaseListingViewModel?
    
    override init() {
        super.init()
              let model = [
                           0:returnFistSection(),
                           1:returnSecondSection(),
                        
                        ]
              let headerView1 = HeaderTableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60))
              headerView1.labelText.text = "Medium."
                let headerView2 = HeaderTableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60))
                headerView2.labelText.text = "Linkedin."
               var headerModel = [0:(headerView1,CGFloat(60)),1:(headerView2,CGFloat(60))];
              baseModel = BaseListingViewModel(model: model as? [Int : [BaseCellViewModel]], sectionHeader: headerModel, sectionFooter: nil);
    }
    
    func returnFistSection()->[BaseCellViewModel] {
        return [
            ImageViewModelCell(imageName: "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80", label: "Profile No 1"),
               LabelCellViewModel(self)
            ]
    }
    
    func returnSecondSection()->[BaseCellViewModel] {
        return [
            ImageViewModelCell(imageName: "https://i.pinimg.com/originals/ca/76/0b/ca760b70976b52578da88e06973af542.jpg", label: "Profile No 2"),
               LabelCellViewModel(self)
            ]
    }
    
    func clickedOnButton() {
           print("clicked on button");
    }
       
    
}
