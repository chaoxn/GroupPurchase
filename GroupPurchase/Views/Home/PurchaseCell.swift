//
//  PurchaseCell.swift
//  GroupPurchase
//
//  Created by fizz on 16/3/10.
//  Copyright © 2016年 chaox. All rights reserved.
//

import UIKit
import SnapKit

class PurchaseCell: UITableViewCell {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var desLabel: UILabel!
    @IBOutlet weak var currentPrice: UILabel!
    @IBOutlet weak var saledLabel: UILabel!
    
    var model: DealModel?
        {
        didSet{
            
            self.saledLabel.text = String(model!.purchase_count)
            self.desLabel.text = model?.Description
            self.currentPrice.text = String(model!.current_price)
            self.titleLabel.text = model?.title
            
//            if let str = String(model?.purchase_count) {
//                 self.saledLabel.text = str
//            }
            
            if let avatar = model!.image_url , let url = NSURL(string: avatar) {
                self.mainImageView?.kf_setImageWithURL(url)
            }

        }
    }
    
    func setup (){

        
    }
    
}