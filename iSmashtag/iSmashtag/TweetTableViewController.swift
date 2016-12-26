//
//  TweeterTableViewController.swift
//  iSmashtag
//
//  Created by Niu Panfeng on 26/12/2016.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit

class TweetTableViewController: UITableViewController {
    
    // MARK: Model
    
    var tweets = [[Tweet]]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: Fetching Tweets
    
    
    // MARK: ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Constants
    private struct Storyboard {
        static let TweetCellIdentifier = "TweetCell"
    }
    
    // MARK: UITableViewDataSource
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
        
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.TweetCellIdentifier, forIndexPath: indexPath) as UITableViewCell
        return cell

    }
}