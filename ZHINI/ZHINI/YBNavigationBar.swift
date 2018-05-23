//
//  YBNavigationBar.swift
//  TINI
//
//  Created by TOOS on 18/4/14.
//  Copyright © 2018年 TOOS. All rights reserved.
//

import Foundation
import UIKit

public let BTN_WIDTH:CGFloat = 44.0
public let CAP:CGFloat = 6.0
public let LABEL_HEIGHT:CGFloat = 24.0
public let SCREEN_CAP:CGFloat = 20.0

class YBNavigationBar : UINavigationBar {
    var label:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        label = UILabel.init(frame: CGRectMake(BTN_WIDTH + CAP, SCREEN_CAP + (frame.size.height - SCREEN_CAP - LABEL_HEIGHT)/2.0, frame.size.width - 2*(BTN_WIDTH + CAP), LABEL_HEIGHT));
        label.textAlignment = .Center;
        label.font = TEXT_FONTSIZE;
        label.textColor = TEXT_COLOR;
        self.addSubview(label);
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setBackgroundViewColor(r:CGFloat, g:CGFloat, b:CGFloat) {
        let color = rgbColor(r, g, b);
        self.backgroundColor = color;
    }
    
    func setTitle(title:String) {
        label.text = title;
    }
}