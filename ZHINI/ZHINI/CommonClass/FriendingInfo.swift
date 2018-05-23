//
//  FriendingInfo.swift
//  TINI
//
//  Created by TOOS on 18/4/15.
//  Copyright © 2018年 TOOS. All rights reserved.
//

import Foundation

enum Friending_Sts:Int {
    case FS_NORMAL = 0
    case FS_CANCEL = 1
    case FS_HIDDEN = 2
    case FS_BAN = 3
}

class FriendingInfo: NSObject {
    
    var sourceId:Int64!
    var friendinger:String!
    var friending_date:Double!
    var friending_status:Friending_Sts!
    
    deinit {
        
    }
    
    override init() {
        super.init();
        sourceId = 0;
        friendinger = "";
        friending_date = 0;
        friending_status = Friending_Sts.init(rawValue: 2);
    }
}