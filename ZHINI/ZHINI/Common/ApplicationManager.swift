//
//  ApplicationManager.swift
//  ZHINI
//
//  Created by Stephen on 2018/5/26.
//  Copyright © 2018年 TOOS. All rights reserved.
//

import UIKit
import Foundation

class ApplicationManager: NSObject {
    static let applicationManager = ApplicationManager();
    private override init() {
        // 单例模式，防止出现多个实例
    }
}
