//
//  Protocolos.swift
//  TableViewSingleDataSource
//
//  Created by Varender Singh on 13/05/20.
//  Copyright © 2020 Varender Singh. All rights reserved.
//

import UIKit

public protocol BaseCellClass {
    var viewModel: BaseCellViewModel? { get set }
    func initWithViewModel(viewModel: BaseCellViewModel)
}

public protocol BaseControllerSetup {
    func registerAllCellsInTableView()
    func setUpAllTheData()
}

public protocol BaseTableViewProtocol {
    func didSelectedCell(indexPath:IndexPath,viewModel:BaseCellViewModel?);
}

public protocol BaseCellViewModel: NSObject {
    var reusableCellIdentifier: String { get set }
}

