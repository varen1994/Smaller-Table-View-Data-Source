//
//  TableViewDataSource.swift
//  TableViewSingleDataSource
//
//  Created by Varender Singh on 13/05/20.
//  Copyright © 2020 Varender Singh. All rights reserved.
//

import UIKit


open class BaseTableViewDataSource: NSObject,UITableViewDataSource,UITableViewDelegate {
   
    var delegate:BaseTableViewProtocol?
    var listModel:BaseListingViewModel?
    
    public init(_ model:BaseListingViewModel?) {
        self.listModel = model
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        if let model = listModel?.model {
            return model.keys.count
        }
        return 0
    }
    
    // MARK:- HEADER AND FOOTER
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let tupple = listModel!.sectionHeaders[section] as? (UIView,CGFloat) {
            return tupple.0
        }
        return nil
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if let tupple = listModel!.sectionHeaders[section] as? (UIView,CGFloat) {
            return tupple.1
        }
        return 0.001
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if let tupple = listModel!.sectionFooters[section] as? (UIView,CGFloat) {
            return tupple.0
        }
        return nil
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if let tupple = listModel!.sectionHeaders[section] as? (UIView,CGFloat) {
            return tupple.1
        }
        return 0.001
    }
    
    // MARK:- BASIC DELEGATE AND DATA SOURCE METHODS
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let modelInsideSection = listModel?.model[section] {
            return modelInsideSection.count
        }
        return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let model = listModel?.model[indexPath.section]![indexPath.row] else { return UITableViewCell() }
        if var cell = tableView.dequeueReusableCell(withIdentifier: model.reusableCellIdentifier, for: indexPath) as? BaseCellClass {
            cell.viewModel = model
            return cell as! UITableViewCell
        }
        return UITableViewCell()
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = delegate {
            delegate.didSelectedCell(indexPath: indexPath, viewModel: (listModel?.model[indexPath.section]![indexPath.row])!)
        }
    }
}
