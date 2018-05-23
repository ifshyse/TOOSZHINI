//
//  AdmireInfo.swift
//  TINI
//
//  Created by TOOS on 18/4/15.
//  Copyright © 2018年 TOOS. All rights reserved.
//

import Foundation

enum Admire_Sts:String {
    case AS_OTHER = "other"
    case AS_IN_PROCESS = "in_process"
    case AS_SUCCESS = "success"
    case AS_FAILED = "failed"
}

class AdmireInfo: NSObject {
    
    var sourceId:Int64!
    var admirer:String!
    var admire_date:Double!
    var admire_price:Double!
    var admire_status:Admire_Sts!
    
    deinit {
        
    }
    
    override init() {
        sourceId = 0;
        admirer = "";
        admire_date = 0;
        admire_price = 0.0;
        admire_status = Admire_Sts.init(rawValue: "other");
    }
}