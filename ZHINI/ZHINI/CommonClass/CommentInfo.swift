//
//  CommentInfo.swift
//  TINI
//
//  Created by TOOS on 18/4/15.
//  Copyright © 2018年 TOOS. All rights reserved.
//

import Foundation

enum Comment_Sts:Int {
    case CS_PUBLISH = 0
    case CS_CANCEL = 1
    case CS_HIDDEN = 2
    case CS_WAIT = 3
    case CS_BAN = 4
    case CS_OTHER = 5
}

class CommentInfo: NSObject {
    
    var sourceId: Int64!
    var comment: String!
    var commentor: String!
    var comment_date: Double!
    var comment_status:Comment_Sts!
    
    deinit {
        
    }
    
    override init() {
        super.init();
        sourceId = 0;
        comment = "";
        commentor = "";
        comment_date = 0;
        comment_status = Comment_Sts.init(rawValue: 2);
    }
}