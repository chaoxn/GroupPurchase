//
//  GroupPurchaseVC.swift
//  GroupPurchase
//
//  Created by fizz on 16/3/9.
//  Copyright © 2016年 chaox. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class GroupPurchaseVC: UIViewController {
    
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor();
        
        self.setTableView()
        self.netRequest()
    }
    
    var urlStr : String?
    let client = LGClient()
    var dic: Dictionary<String, String> = ["city": "北京", "page": "1"]
    
    func netRequest(){
        
      urlStr = client.serializeURL("http://api.dianping.com/v1/deal/find_deals", params: dic)
    
        Alamofire.request(.GET, urlStr!, parameters: nil)
            .responseJSON { response in
                
                if let value = response.result.value {

                    let newJson = JSON(value)
                    
                    let jTitle = newJson["deals"][0]["title"].string
                    
                    _ = DealDeatilModel(
                    
                        self.title = jTitle
                    )
                    
                    
                    print("JSON: \(jTitle))")
                }
                
                
        }
    }
    
    private func setTableView(){
        
        tableView = UITableView(frame: self.view.bounds, style: .Plain)
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = 100;
        tableView.registerNib(UINib(nibName: "PurchaseCell", bundle: nil), forCellReuseIdentifier: "CustomCellOne")
        view.addSubview(tableView)
        
        let headerView = NSBundle.mainBundle().loadNibNamed("HeaderView", owner: self, options: nil)[0]
        tableView.tableHeaderView = headerView as? UIView;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension GroupPurchaseVC:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCellOne", forIndexPath: indexPath) as! PurchaseCell

        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}









