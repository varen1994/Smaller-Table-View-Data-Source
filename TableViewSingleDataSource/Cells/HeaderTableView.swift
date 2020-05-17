//
//  HeaderTableView.swift
//  TableViewSingleDataSource
//
//  Created by Varender Singh on 13/05/20.
//  Copyright © 2020 Varender Singh. All rights reserved.
//

import UIKit

class HeaderTableView: UIView {

    @IBOutlet weak var customView: UIView!
    @IBOutlet weak var labelText: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
          customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
          customInit()
    }
    
    func customInit() {
        print("----- common Init called -------")
        Bundle.main.loadNibNamed("HeaderXib", owner: self, options: nil)
        addSubview(self.customView)
        self.customView.frame = self.frame
        self.customView.backgroundColor = UIColor.orange
        self.labelText.text = "Ganga"
    }

}
