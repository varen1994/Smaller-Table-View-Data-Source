//
//  ViewController.swift
//  TableViewSingleDataSource
//
//  Created by Varender Singh on 13/05/20.
//  Copyright © 2020 Varender Singh. All rights reserved.
//

import UIKit
 
class ViewController: UITableViewController,BaseControllerSetup,LabelCellProtocol {
  
    var dataSourceAndDelegate:BaseTableViewDataSource?
    var baseModel:BaseListingViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerAllCellsInTableView()
        setUpAllTheData()
    }

    func registerAllCellsInTableView() {
    }
      
    func setUpAllTheData() {
          let model = [
            0:[LabelCellViewModel(nil),ImageViewModelCell(),LabelCellViewModel(nil),LabelCellViewModel(nil),LabelCellViewModel(self),LabelCellViewModel(nil)],
                        1:[LabelCellViewModel(nil),LabelCellViewModel(nil),ImageViewModelCell(),ImageViewModelCell(),ImageViewModelCell(),ImageViewModelCell(),ImageViewModelCell()]
                      ]
        
        let headerView = HeaderTableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 30))
        
        
        let headerModel = [1:(headerView,CGFloat(60))];
        baseModel = BaseListingViewModel(model: model as? [Int : [BaseCellViewModel]], sectionHeader: headerModel, sectionFooter: headerModel);
        dataSourceAndDelegate = BaseTableViewDataSource(baseModel)
        self.tableView.delegate = dataSourceAndDelegate
        self.tableView.dataSource = dataSourceAndDelegate
        self.tableView.reloadData()
    }
    
    func clickedOnButton() {
        print("clicked on button");
    }
}

