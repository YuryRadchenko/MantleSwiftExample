//
//  MSCellConfigureCellTypeAble.swift
//  MantleSwiftExample
//
//  Created by Yury Radchenko on 01.02.17.
//  Copyright © 2017 Yury Radchenko. All rights reserved.
//

import Foundation
import UIKit

protocol MSCellConfigureCellTypeAble {
    func configure(news: MSNews, cellType: DetailTableModel)
}
