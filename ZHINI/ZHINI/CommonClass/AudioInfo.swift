//
//  AudioInfo.swift
//  TINI
//
//  Created by TOOS on 18/4/15.
//  Copyright © 2018年 TOOS. All rights reserved.
//

import Foundation

class AudioInfo: CommonInfo {
    
    var audio_url:String!
    
    deinit {
        
    }
    
    override init() {
        super.init()
        audio_url = "";
        type = Common_TYPE.CT_AUDIO;
    }
}