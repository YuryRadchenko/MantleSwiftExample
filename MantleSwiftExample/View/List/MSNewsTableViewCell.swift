//
//  MSNewsTableViewCell.swift
//  MantleSwiftExample
//
//  Created by Yury Radchenko on 29.01.17.
//  Copyright © 2017 Yury Radchenko. All rights reserved.
//

import UIKit

class MSNewsTableViewCell: UITableViewCell, RYCellDequeueReusable {

    @IBOutlet weak var titleNews: UILabel! {
        didSet {
            titleNews.numberOfLines = 0
            titleNews.font = UIFont.systemFont(ofSize: 14)
        }
    }
    
    static let rowHeight = CellSettings.rowHeightStandard
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(news: MSNews) {
        self.titleNews.text = news.title
    }
}
