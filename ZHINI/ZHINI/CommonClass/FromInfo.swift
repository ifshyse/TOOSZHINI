//
//  FromInfo.swift
//  TINI
//
//  Created by TOOS on 18/4/15.
//  Copyright © 2018年 TOOS. All rights reserved.
//

import Foundation

enum From_Type:String {
    case FT_OTHER = "other"
    case FT_GUANFANG = "guanfang"
    case FT_LIANZAI = "lianzai"
    case FT_GUANZHU = "guanzhu"
    case FT_ZHUANTI = "zhaunti"
    case FT_DOUBAN = "douban"
    case FT_JIANSHU = "jianshu"
    case FT_ZHIHU = "zhihu"
    case FT_WEIXIN = "weixin"
    case FT_QQ = "qq"
    case FT_WEIBO = "weibo"
}

class FromInfo: NSObject {
    
    var sourceId:Int64!
    var from:From_Type!
    var from_title:String!
    var from_img_url:String?
    var editor:String!
    var from_date:Double!
    var last_modify_date:Double?
    var hex_color:Int!
    
    deinit {
        
    }
    
    override init() {
        super.init();
        sourceId = 0;
        from = From_Type.init(rawValue: "other");
        editor = "";
        from_title = "";
        from_date = 0;
        hex_color = 0xD8D8D8;
    }
}