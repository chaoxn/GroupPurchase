//
//  BaseXibView.swift
//  GroupPurchase
//
//  Created by fizz on 16/3/10.
//  Copyright © 2016年 chaox. All rights reserved.
//

import UIKit

class baseXibView : UIView {
    
    var view:UIView?
    
    func initFromXib(){
        //获取Xib文件名字
        let xibName = NSStringFromClass(self.classForCoder)
        let xibClassName = xibName.characters.split{$0 == "."}.map(String.init).last
        //使用Xib初始化一个View
        let view = NSBundle.mainBundle().loadNibNamed(xibClassName, owner: self, options: nil).first as! UIView
        view.frame = self.bounds
        view.translatesAutoresizingMaskIntoConstraints = true
        view.autoresizingMask = [.FlexibleWidth,.FlexibleHeight]
        self.addSubview(view)
        self.view = view
    }
    override init(frame: CGRect) {
        super.init(frame:frame)
        initFromXib()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)!
        initFromXib()
    }
}