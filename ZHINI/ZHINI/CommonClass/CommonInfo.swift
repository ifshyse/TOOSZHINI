//
//  CommonInfo.swift
//  TINI
//
//  Created by TOOS on 18/4/16.
//  Copyright © 2018年 TOOS. All rights reserved.
//

import Foundation

enum Common_TYPE:Int {
    case CT_OTHER = 0
    case CT_AUDIO = 1
    case CT_VIDEO = 2
    case CT_BOOK = 3
    case CT_IMAGE = 4
    case CT_LIANZAI = 5
}

class CommonInfo: NSObject {
    
    var sourceId:Int64!
    var img_url:String!
    var title:String!
    var publish_date:Double!
    var from:NSMutableArray?
    var editor:String!
    var type:Common_TYPE!
    
    deinit {
        
    }
    
    override init() {
        super.init()
        
        sourceId = 0;
        title = "";
        img_url = "";
        publish_date = 0;
        type = Common_TYPE.init(rawValue: 0);
    }
}