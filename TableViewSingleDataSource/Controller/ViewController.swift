//
//  ViewController.swift
//  TableViewSingleDataSource
//
//  Created by Varender Singh on 13/05/20.
//  Copyright © 2020 Varender Singh. All rights reserved.
//

import UIKit
 
class ViewController: UITableViewController,BaseControllerSetup {
  
    var viewModel:ViewModel?
    var dataSourceAndDelegate:BaseTableViewDataSource?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.sectionHeaderHeight = UITableView.automaticDimension
        self.tableView.sectionFooterHeight = UITableView.automaticDimension
        registerAllCellsInTableView()
        setUpAllTheData()
    }

    func registerAllCellsInTableView() {
        
    }
      
    func setUpAllTheData() {
        viewModel = ViewModel()
        dataSourceAndDelegate = BaseTableViewDataSource(viewModel?.baseModel)
        self.tableView.delegate = dataSourceAndDelegate
        self.tableView.dataSource = dataSourceAndDelegate
        self.tableView.reloadData()
    }
    
}

