//
//  DealDeatilModel.swift
//  GroupPurchase
//
//  Created by fizz on 16/3/16.
//  Copyright © 2016年 chaox. All rights reserved.
//

import Foundation
import ObjectMapper

class DealDeatilModel: Mappable {
    
    var status      : Int?
    var total_count : Int?
    var count       : Int?
    var deals       : [DealModel]?
    
//    返回可能为空对象的初始化方法暂时用不到。
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        status      <- map ["status"]
        total_count <- map ["total_count"]
        count       <- map["count"]
        deals        <- map["deals"]
    }
}

class DealModel : Mappable {
    
    var title           : String?
    var deal_id         : String?
    var Description     : String?
    var current_price   : Int?
    var purchase_count  : Int?
    var image_url       : String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {

        title           <- map ["title"]
        deal_id         <- map ["deal_id"]
        Description     <- map ["description"]
        current_price   <- map ["current_price"]
        purchase_count  <- map ["purchase_count"]
        image_url       <- map ["image_url"]
    }
}

