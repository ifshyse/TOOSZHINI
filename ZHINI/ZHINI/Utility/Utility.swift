//
//  Utility.swift
//  SwiftTest
//
//  Created by TOOS on 18/4/14.
//  Copyright © 2018年 TOOS. All rights reserved.
//

import Foundation
import UIKit

    
public func showDisplayViewController(superViewController:UIViewController, contentViewController:UIViewController) {
    superViewController.addChildViewController(contentViewController);
    superViewController.view.addSubview(contentViewController.view);
    contentViewController.view.frame = superViewController.view.bounds;
    contentViewController.didMoveToParentViewController(superViewController);
}

public func hideDisplayViewController(superViewController:UIViewController, contentViewController:UIViewController) {
    contentViewController.willMoveToParentViewController(nil);
    contentViewController.view.removeFromSuperview();
    contentViewController.removeFromParentViewController();
}

public func rgbColor(r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor
{
    return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
}

func rgbColor_FromHex(rgbValue: Int) -> (UIColor) {
    
    return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,
        green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,
        blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,
        alpha: 1.0)
}

public func height_for_text(textStr:String,font:UIFont,width:CGFloat) -> CGFloat {
    let normalText: NSString = textStr
    let size = CGSizeMake(width,CGFloat(MAXFLOAT))
    let dic = NSDictionary(object: font, forKey: NSFontAttributeName)
    let stringSize = normalText.boundingRectWithSize(size, options: .UsesLineFragmentOrigin, attributes: dic as? [String : AnyObject], context:nil).size
    return stringSize.height
}

public func width_for_text(textStr:String,font:UIFont,height:CGFloat) -> CGFloat {
    let normalText: NSString = textStr
    let size = CGSizeMake(CGFloat(MAXFLOAT),height)
    let dic = NSDictionary(object: font, forKey: NSFontAttributeName)
    let stringSize = normalText.boundingRectWithSize(size, options: .UsesLineFragmentOrigin, attributes: dic as? [String : AnyObject], context:nil).size
    return stringSize.width
}

public func dateStringFromTimeStamp(timeStamp:Double) -> String {
    let timeInterval:NSTimeInterval = NSTimeInterval(timeStamp);
    let date = NSDate(timeIntervalSince1970: timeInterval);
    let now = NSDate();
    let time = now.timeIntervalSinceDate(date)
    if time > 4*86400 {
        let dformatter = NSDateFormatter()
        dformatter.dateFormat = "yyyy.MM.dd"
        return ("\(dformatter.stringFromDate(date))")
    }else if time < 4*86400 && time >= 3*86400 {
        return "三天前"
    }else if time < 3*86400 && time >= 2*86400 {
        return "两天前"
    }else if time < 2*86400 && time >= 86400 {
        return "一天前"
    }else if time < 86400 && time >= 3600 {
        let hour = time / 3600;
        return ("\(hour)小时前")
    }else if time < 3600 && time >= 60 {
        let minute = time / 60;
        return ("\(minute)分钟前")
    }else if time < 60 {
        let sec = time % 60;
        return ("\(sec)秒钟前")
    }
    return "";
}
