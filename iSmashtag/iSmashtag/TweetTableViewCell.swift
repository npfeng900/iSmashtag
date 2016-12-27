//
//  TweeterTableViewCell.swift
//  iSmashtag
//
//  Created by Niu Panfeng on 26/12/2016.
//  Copyright © 2016 NaPaFeng. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var information: UILabel!
    
    var tweet: Int! {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        headerView.backgroundColor = UIColor(red: 0.0 , green: 0.0, blue: 1.0, alpha: CGFloat(tweet! % 10) / 5.0)
        headerView.tintColor = headerView.backgroundColor
        title.text = "\(tweet)"
        information.text = "\(tweet)"
    }
}
