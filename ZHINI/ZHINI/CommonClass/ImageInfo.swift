//
//  ImageInfo.swift
//  TINI
//
//  Created by TOOS on 18/4/16.
//  Copyright © 2018年 TOOS. All rights reserved.
//

import Foundation

class ImageInfo: CommonInfo {
    
    deinit {
        
    }
    
    override init() {
        super.init()
        type = Common_TYPE.CT_IMAGE;
    }
}