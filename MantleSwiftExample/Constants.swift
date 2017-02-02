//
//  Constants.swift
//  MantleSwiftExample
//
//  Created by Yury Radchenko on 29.01.17.
//  Copyright © 2017 Yury Radchenko. All rights reserved.
//

import UIKit

enum MSURL {
    static let base = "https://habrahabr.ru/"
    static let rss2json = "https://api.rss2json.com/v1/api.json?rss_url="
}

enum CellSettings {
    static let sepatarorInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    static let rowHeightStandard: CGFloat = 44.0
}

enum TableSettings {
    static let sepatarorInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    static let rowHeightStandard: CGFloat = 44.0
    static let contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
}
