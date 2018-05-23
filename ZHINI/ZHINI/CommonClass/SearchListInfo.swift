//
//  SearchListInfo.swift
//  TINI
//
//  Created by TOOS on 18/4/15.
//  Copyright © 2018年 TOOS. All rights reserved.
//

import Foundation

enum List_Status:Int {
    case LS_PUBLISH = 0
    case LS_CANCEL = 1
    case LS_HIDDEN = 2
    case LS_WAIT = 3
    case LS_BAN = 4
    case LS_OTHER = 5
}

enum Info_Status:Int {
    case IS_PUBLIC = 0
    case IS_PRIVATE = 1
    case IS_PART_PRIVATE = 2
    case IS_OTHER = 3
}

enum List_Type:String {
    case LT_OTHER = "other"
    case LT_TEXT = "text"
    case LT_AUDIO = "audio"
    case LT_VIDEO = "video"
    case LT_BOOK = "book"
    case LT_IMAGE = "image"
}

class SearchListInfo: NSObject {
    
    var sourceId:Int64!
    var publish_date: Double!
    var from:NSMutableArray?
    var comment:NSMutableArray?
    var friending:NSMutableArray?
    var admire:NSMutableArray?
    var list_status:List_Status!
    var list_type:List_Type!
    var last_modify_date: Double?
    var contentInfo:ContentInfo!
    var videoInfo:VideoInfo?
    var audioInfo:AudioInfo?
    var bookInfo:BookInfo?
    var lianZaiInfo:LianZaiInfo?
    
    //var imageInfo:NSMutableArray?
    
    var readStatus:Bool!
    var infoStatus:Info_Status!
    
    deinit {
        
    }
    
    override init() {
        super.init();
        sourceId = 0;
        publish_date = 0;
        list_status = List_Status.LS_HIDDEN;
        list_type = List_Type.init(rawValue: "other");
        contentInfo = ContentInfo.init();
        readStatus = false;
        infoStatus = Info_Status.init(rawValue: 1);
    }
}
