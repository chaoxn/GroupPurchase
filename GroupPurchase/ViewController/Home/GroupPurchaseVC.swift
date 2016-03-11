//
//  GroupPurchaseVC.swift
//  GroupPurchase
//
//  Created by fizz on 16/3/9.
//  Copyright © 2016年 chaox. All rights reserved.
//

import UIKit
import Alamofire

class GroupPurchaseVC: UIViewController {
    
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor();
        
        self.setTableView()
        self.netRequest()
    }
    
    func netRequest(){
        
//        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjects:@[self.initianCity,@"1"] forKeys:@[@"city",@"page"]];
//         = [LGClient serializeURL:"http://api.dianping.com/v1/deal/find_deals" params:nil];
        
        Alamofire.request(.GET, "http://bubo.in/poe/poem?s=13", parameters: nil)
            .responseJSON { response in
                
//                print(response.request)  // 请求对象
//                print(response.response) // 响应对象
//                print(response.data)     // 服务端返回的数据
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
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











