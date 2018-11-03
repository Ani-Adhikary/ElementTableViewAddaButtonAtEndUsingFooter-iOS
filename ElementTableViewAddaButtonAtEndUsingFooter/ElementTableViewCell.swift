//
//  ElementTableViewCell.swift
//  ElementTableViewWithNestedTblView
//
//  Created by Ani Adhikary on 02/06/18.
//  Copyright © 2018 Ani Adhikary. All rights reserved.
//

import UIKit

class ElementTableViewCell: UITableViewCell {
    
    @IBOutlet weak var elementLabel: UILabel!    
    @IBOutlet weak var elementSymbolLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

