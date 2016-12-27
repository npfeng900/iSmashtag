//
//  TweeterTableViewController.swift
//  iSmashtag
//
//  Created by Niu Panfeng on 26/12/2016.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit

class TweetTableViewController: UITableViewController, UITextFieldDelegate {
    
    // MARK: Model
    var tweets = [[Int]]() {
        didSet {
            tableView.reloadData() //====update tableView 满
        }
    }
    
    var searchText: String? = "1" {
        didSet {
            tweets = [[Int]]()
            lastSucessfulRequestText = nil  //重新设置searchText时，将lastSearchTextnil
            searchTextField?.text = searchText
            refresh()              //====update tweets
        }
    }

    // MARK: Fetching Tweets
    private func refresh() {
        if refreshControl != nil {
            refreshControl?.beginRefreshing()
        }
        refresh(refreshControl)
        
    }
    @IBAction func refresh(sender: UIRefreshControl?) {
        if searchText != nil
        {
            if let requestText = nextRequsetTextToAttemp
            {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                    
                    NSThread.sleepForTimeInterval(2) //睡眠3秒
                    var array2D = [[Int]]()
                    for var i = Int(requestText)!; i <= 10; i++ {
                        var array = [Int]()
                        for var j = 1; j <= 5; j++ {
                            array.append(i * 10 + j)
                        }
                        array2D.append(array)
                    }
                    //更新主线程的东西
                    dispatch_async(dispatch_get_main_queue()) {
                        if array2D.count > 0
                        {
                            self.tweets = array2D
                            self.lastSucessfulRequestText = requestText
                        }
                        //输入的数字太大，循环不执行， array2D.count可能为0
                        sender?.endRefreshing()
                    }
                }
            } else {
                sender?.endRefreshing()
            }
        } else {
            sender?.endRefreshing()
        }
    }
    var lastSucessfulRequestText: String?
    var nextRequsetTextToAttemp: String? {
        if lastSucessfulRequestText == nil
        {
            if Int(searchText!) != nil
            {
                return searchText!
            } else {
                return nil
            }
        }
        return lastSucessfulRequestText
        
    }
   
    
    // UITextField控件，用来设置 searchText
    @IBOutlet weak var searchTextField: UITextField! {
        didSet {
            searchTextField.delegate = self
            searchTextField.text = searchText
        }
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == searchTextField {
            textField.resignFirstResponder() //隐藏keyboard
            searchText = textField.text
        }
        return true
    }
   
    
    // MARK: ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension //自动高度
        refresh()                  //====update tweets
    }
    
    // MARK: Constants
    private struct Storyboard {
        static let TweetCellIdentifier = "TweetCell"
    }
    
    // MARK: UITableViewDataSource
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return tweets.count
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets[section].count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.TweetCellIdentifier, forIndexPath: indexPath) as! TweetTableViewCell
        cell.tweet = tweets[indexPath.section][indexPath.row]
        
        return cell

    }
}
