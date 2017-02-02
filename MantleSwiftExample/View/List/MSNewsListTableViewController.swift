//
//  MSNewsListTableViewController.swift
//  MantleSwiftExample
//
//  Created by Yury Radchenko on 29.01.17.
//  Copyright © 2017 Yury Radchenko. All rights reserved.
//

import UIKit

class MSNewsListTableViewController: UITableViewController {
    
    @IBOutlet var activityView: UIActivityIndicatorView! {
        didSet {
            activityView.activityIndicatorViewStyle = .gray
            activityView.hidesWhenStopped = true
        }
    }
    
    fileprivate var rssList: [MSNews] = []
    
    //MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorInset = CellSettings.sepatarorInsets
        
        self.tableView.estimatedRowHeight = MSNewsTableViewCell.rowHeight
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.title = "Feed"
        
        self.view.addSubview(self.activityView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.activityView.center = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2 - 64.0)
        
        if self.rssList.isEmpty {
            
            self.activityView.startAnimating()
            
            MSModelManager.shared.getFeed { (result) in
                switch result {
                case .success(let rss):
                    self.rssList = rss
                    self.tableView.reloadData()
                    
                case .failure(let error):
                    print(error.discription)
                }
                
                self.activityView.stopAnimating()
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
        return self.rssList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = MSNewsTableViewCell.cell(table: tableView, indexPath: indexPath)
        cell.configure(news: rssList[indexPath.row])
        return cell
    }
    
    //MARK: - UITableViewDelegate -
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let detailVC = MSNewsDetailTableViewController.storyboardInstance {
            detailVC.news = self.rssList[indexPath.row]
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}
