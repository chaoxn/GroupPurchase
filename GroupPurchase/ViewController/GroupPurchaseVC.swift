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
import ObjectMapper
import AlamofireObjectMapper

class GroupPurchaseVC: UIViewController {
    
    private var tableView: UITableView!
    var dataSoure: [DealModel] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor();
        self.setTableView()
        self.netRequest()
    }
    
    var urlStr : String?
    let client = LGClient()
    var littleModel = DealModel?()
    
    var dic: Dictionary<String, String> = ["city": "北京", "page": "1"]
    
    func netRequest(){
        
      urlStr = client.serializeURL("http://api.dianping.com/v1/deal/find_deals", params: dic)
    
        /*  SwiftJson
        
        Alamofire.request(.GET, urlStr!, parameters: nil)
            .responseJSON { response in
                
                let value = response.result.value
                let newJson = JSON(value!)
                    let jTitle = newJson["deals"][0]["title"].string
                    print("JSON: \(value))")
        } 
                                                        */
        
        Alamofire.request(.GET, urlStr!).responseObject {
            (response: Response<DealDeatilModel, NSError>) in
            
            let BigModel = response.result.value
            print(BigModel!.count)

            if let dealModel = BigModel?.deals {
                for forecast in dealModel {
                    
                    self.dataSoure.append(forecast)
                    print(forecast.title)
                }
//                print(self.dataSoure)
                self.tableView.reloadData()
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

        cell.model = self.dataSoure[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSoure.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let pdVC = PurchaseDetailVC()
        
        navigationController?.pushViewController(pdVC, animated: true)
        
        print(indexPath.row)
    }
    
}

