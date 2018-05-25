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
    contentViewController.didMove(toParentViewController: superViewController);
}

public func hideDisplayViewController(superViewController:UIViewController, contentViewController:UIViewController) {
    contentViewController.willMove(toParentViewController: nil);
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
    let normalText: NSString = textStr as NSString
    let size = CGSize.init(width: width, height: CGFloat(MAXFLOAT))
    let dic = NSDictionary(object: font, forKey: kCTFontAttributeName as! NSCopying)
    let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedStringKey : Any], context:nil).size
    return stringSize.height
}

public func width_for_text(textStr:String,font:UIFont,height:CGFloat) -> CGFloat {
    let normalText: NSString = textStr as NSString
    let size = CGSize.init(width: CGFloat(MAXFLOAT), height: height)
    let dic = NSDictionary(object: font, forKey: kCTFontAttributeName as! NSCopying)
    let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedStringKey : Any], context:nil).size
    return stringSize.width
}

public func dateStringFromTimeStamp(timeStamp:Double) -> String {
    let timeInterval:TimeInterval = TimeInterval(timeStamp);
    let date = NSDate(timeIntervalSince1970: timeInterval);
    let now = NSDate();
    let time = now.timeIntervalSince(date as Date)
    if time > 4*86400 {
        let dformatter = DateFormatter()
        dformatter.dateFormat = "yyyy.MM.dd"
        return ("\(dformatter.string(from: date as Date))")
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
        let sec = (Int)(time) % 60;
        return ("\(sec)秒钟前")
    }
    return "";
}
