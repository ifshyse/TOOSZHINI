//
//  ContentInfo.swift
//  TINI
//
//  Created by TOOS on 18/4/15.
//  Copyright © 2018年 TOOS. All rights reserved.
//

import Foundation

class ContentInfo: NSObject {
    
    var sourceId:Int64!
    var title:String!
    var content_text:String!
    var imageInfo:NSMutableArray?
    var editor:String!
    var editor_img_url:String! //if not exist, system will distribute
    var publish_date:String?
    var last_modify_date:Double?
    
    deinit {
        
    }
    
    override init() {
        super.init();
        sourceId = 0;
        title = "";
        content_text = "";
        editor = "";
        editor_img_url = "";
    }
}