//
//  HeaderView.swift
//  GroupPurchase
//
//  Created by fizz on 16/3/10.
//  Copyright © 2016年 chaox. All rights reserved.
//

import UIKit

class HeaderView : UIView {
    
    
    @IBAction func buttonClicked(sender: UIButton) {
        
        print(sender.tag)
        
        
    /*
        switch sender.tag {
            
        case 0: break
        case 1: break
        case 2: break
        case 3: break
        case 4: break
        case 5: break
        case 6: break
        case 7: break
        case 8: break
        default: break
        }
        */
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)!
    }
}
