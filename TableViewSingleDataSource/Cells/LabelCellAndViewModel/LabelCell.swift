//
//  LabelCell.swift
//  TableViewSingleDataSource
//
//  Created by Varender Singh on 13/05/20.
//  Copyright © 2020 Varender Singh. All rights reserved.
//

import UIKit

class LabelCell: UITableViewCell, BaseCellClass {
    
     @IBOutlet weak var label: UILabel!
    var viewModel: BaseCellViewModel?
    
    func initWithViewModel(viewModel: BaseCellViewModel) {
        if let viewModel = viewModel as? LabelCellViewModel {
          self.label.text = viewModel.label
        }
    }
    
    override  func awakeFromNib() {
       self.selectionStyle  = .none
    }
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func clickedOnButton(_ sender: Any) {
        if let viewModel = viewModel as? LabelCellViewModel {
            viewModel.clickedOnButton()
        }
    }
    
}
