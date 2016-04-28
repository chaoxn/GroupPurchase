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
            
            self.desLabel.text = model?.Description
            self.titleLabel.text = model?.title
            
            //通过在条件判断语句中（如if、while等）把Optional值直接给一个临时常量，Swift会自动检测Optional是否包含值，如果包含值，会隐式的拆包并给那个临时常量
            
            if let str = model?.purchase_count {
                 self.saledLabel.text = "已售" + String(str)
            }
            
            if let strPrice = model?.current_price{
                self.currentPrice.text = String(strPrice)
            }
            
            if let avatar = model!.image_url , let url = NSURL(string: avatar) {
                self.mainImageView?.kf_setImageWithURL(url)
            }

        }
    }
    
    func setup (){

        
    }
    
}