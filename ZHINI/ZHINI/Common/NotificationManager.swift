//
//  NotificationManager.swift
//  ZHINI
//
//  Created by Stephen on 2018/5/26.
//  Copyright © 2018年 TOOS. All rights reserved.
//

import UIKit

class NotificationManager: NSObject {
    static let notificationManager = NotificationManager();
    private override init() {
        // 单例模式，防止出现多个实例
    }
}
