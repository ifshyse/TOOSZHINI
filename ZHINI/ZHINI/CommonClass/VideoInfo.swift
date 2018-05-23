//
//  VideoInfo.swift
//  TINI
//
//  Created by TOOS on 18/4/15.
//  Copyright © 2018年 TOOS. All rights reserved.
//

import Foundation

class VideoInfo: CommonInfo {
    
    var video_url:String!
    
    deinit {
        
    }
    
    override init() {
        super.init()
        video_url = "";
        type = Common_TYPE.CT_VIDEO;
    }
}