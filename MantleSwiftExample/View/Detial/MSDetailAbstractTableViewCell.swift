//
//  MSDetailAbstractTableViewCell.swift
//  MantleSwiftExample
//
//  Created by Yury Radchenko on 01.02.17.
//  Copyright © 2017 Yury Radchenko. All rights reserved.
//

import UIKit

internal let kFontStandard = UIFont.systemFont(ofSize: 12)

class MSDetailAbstractTableViewCell: UITableViewCell, RYCellDequeueReusable {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        self.accessoryType = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
