//
//  MSNewsDetailTableViewController.swift
//  MantleSwiftExample
//
//  Created by Yury Radchenko on 29.01.17.
//  Copyright © 2017 Yury Radchenko. All rights reserved.
//

import UIKit
import SafariServices

final class MSNewsDetailTableViewController: UITableViewController {
    
    var news: MSNews?
    fileprivate let dataTypes = DetailTableModel.allValues
    fileprivate var content = ""
    
    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = .none
        self.tableView.contentInset = TableSettings.contentInset
        
        self.tableView.estimatedRowHeight = CellSettings.rowHeightStandard
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.title = "News"
        
        if let rowIndex = self.dataTypes.index(of: .rowContent) {
            DispatchQueue.global(qos: .default).async {
                self.content = self.news!.contentString
                DispatchQueue.main.async(execute: {
                    let rowReload = IndexPath(row: rowIndex, section: 0)
                    self.tableView.reloadRows(at: [rowReload], with: .fade)
                })
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let _ = self.news {
            return self.dataTypes.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dataType = self.dataTypes[indexPath.row]
        
        switch dataType {
        case DetailTableModel.rowTitle:
            let cell = MSHeaderTableViewCell.cell(table: tableView, indexPath: indexPath)
            cell.configure(news: self.news!, cellType: dataType)
            return cell
        
        case DetailTableModel.rowDate:
            let cell = MSHeaderTableViewCell.cell(table: tableView, indexPath: indexPath)
            cell.configure(news: self.news!, cellType: dataType)
            return cell
        
        case DetailTableModel.rowAuthor:
            let cell = MSDescriptionTableViewCell.cell(table: tableView, indexPath: indexPath)
            cell.configure(news: self.news!, cellType: dataType)
            return cell
        
        case DetailTableModel.rowCategory:
            let cell = MSDescriptionTableViewCell.cell(table: tableView, indexPath: indexPath)
            cell.configure(news: self.news!, cellType: dataType)
            return cell
        
        case DetailTableModel.rowContent:
            let cell = MSContentTableViewCell.cell(table: tableView, indexPath: indexPath)
            cell.configure(content: self.content)
            return cell
        }
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case DetailTableModel.rowContent.hashValue:
            if let urlRequest = self.news?.link, self.news!.link.isNotEmpty {
                let safariVC = SFSafariViewController(url: URL(string:urlRequest)!, entersReaderIfAvailable: true)
                self.present(safariVC, animated: true, completion: nil)
            }
        default:
            break
        }
    }
}

// MARK: - RYStoryboardInstanceable -
extension MSNewsDetailTableViewController: RYStoryboardInstanceable {
    internal static var storyboardName: RYStoryboard = .main
}
