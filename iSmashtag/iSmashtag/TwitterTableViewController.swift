//
//  TweeterTableViewController.swift
//  iSmashtag
//
//  Created by Niu Panfeng on 26/12/2016.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit
import Twitter

class TwitterTableViewController: UITableViewController {

    // MARK: ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Constants
    private struct Storyboard {
        static let TweetCellIdentifier = "TwitterCell"
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
