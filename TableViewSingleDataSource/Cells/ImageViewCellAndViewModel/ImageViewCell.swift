//
//  ImageViewCell.swift
//  TableViewSingleDataSource
//
//  Created by Varender Singh on 13/05/20.
//  Copyright © 2020 Varender Singh. All rights reserved.
//

import UIKit

class ImageViewCell:UITableViewCell, BaseCellClass {

    var viewModel: BaseCellViewModel?
    
    func initWithViewModel(viewModel: BaseCellViewModel) {
        if let viewModel = viewModel as? ImageViewModelCell, imageViewLogo?.image == nil {
            do {
               imageViewLogo?.image = try UIImage(data: Data(contentsOf: URL(string: viewModel.imageName)!))
            } catch {
                print("some error")
            }
            label.text = viewModel.label
        }
    }
    
    
    @IBOutlet var imageViewLogo: UIImageView!
    @IBOutlet var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle  = .none
    }
    
 

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

