//
//  LianZaiView.swift
//  TINI
//
//  Created by TOOS on 18/4/16.
//  Copyright © 2018年 TOOS. All rights reserved.
//

import Foundation
import UIKit

let CVIEW_WIDTH:CGFloat = 8.0;
let CVIEW_CAP_WIDTH:CGFloat = 5.0;
let CVIEW_TITLE_HEIGHT:CGFloat = 20.0;

class CommonView:UIControl {
    
    var commonInfo:CommonInfo!
    var imgView:UIImageView!
    var titleLb:UILabel!
    var fromLb:UILabel?
    
    deinit {
        
    }
    
    init(frame: CGRect, commonInfo:CommonInfo) {
        super.init(frame: frame);
        self.commonInfo = commonInfo;
        
        imgView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: CVIEW_WIDTH, height: frame.size.height));
        imgView.image = UIImage(named: self.commonInfo.img_url);
        self.addSubview(imgView)
        
        var fromWidth:CGFloat = 0.0;
        if self.commonInfo.from != nil {
            let from = self.commonInfo.from![0] as! FromInfo;
            if from.from_title.count > 0 {
                fromWidth = width_for_text(textStr: from.from_title, font: COMMON_SEARCH_FONTSIZE, height: frame.size.height);
            }
        }
        
        titleLb = UILabel.init(frame: CGRect.init(x:CVIEW_WIDTH + CVIEW_CAP_WIDTH, y:(frame.size.height - CVIEW_TITLE_HEIGHT)/2.0, width:frame.size.width - CVIEW_WIDTH - 2*CVIEW_CAP_WIDTH - fromWidth, height:CVIEW_TITLE_HEIGHT));
        titleLb.text = self.commonInfo.title;
        titleLb.font = COMMON_SEARCH_FONTSIZE;
        titleLb.textColor = TITLE_SEARCH_COLOR;
        titleLb.textAlignment = .center;
        self.addSubview(titleLb);
        
        if fromWidth > 0 {
            
            let from = self.commonInfo.from![0] as! FromInfo;
            
            fromLb = UILabel.init(frame: CGRect.init(x:frame.size.width - fromWidth - CVIEW_CAP_WIDTH, y:(frame.size.height - CVIEW_TITLE_HEIGHT)/2.0, width:fromWidth, height:CVIEW_TITLE_HEIGHT));
            fromLb!.text = from.from_title;
            fromLb!.font = COMMON_SEARCH_FONTSIZE;
            fromLb!.textColor = TITLE_SEARCH_COLOR;
            fromLb!.textAlignment = .center;
            self.addSubview(fromLb!);
        }
        
        self.layer.borderColor = BORDER_COLOR.cgColor;
        self.layer.cornerRadius = 2.0;
        self.layer.borderWidth = 0.5;
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
