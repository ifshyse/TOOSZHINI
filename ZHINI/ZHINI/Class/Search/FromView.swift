//
//  FromView.swift
//  TINI
//
//  Created by TOOS on 18/4/16.
//  Copyright © 2018年 TOOS. All rights reserved.
//

import UIKit

let FROM_CAP_WIDTH:CGFloat = 1.0;
let FROM_IMG_WIDTH:CGFloat = 6.0;

class FromView:UIView {
    
    var label:UILabel!
    var imgView:UIImageView?
    
    deinit {
        
    }
    
    init(point:CGPoint,height:CGFloat, text:String, img:String?, needBorder:Bool, hexColor:Int) {
        let width = width_for_text(textStr: text, font: FROM_SEARCH_FONTSIZE, height: height);
        var imgWidth:CGFloat = 0;
        if img != nil {
            if img!.count > 0 {
                imgWidth = FROM_IMG_WIDTH;
            }
        }
        super.init(frame:CGRect.init(x:point.x, y:point.y, width:3*FROM_CAP_WIDTH + width + imgWidth, height:height));
        label = UILabel.init(frame:CGRect.init(x:FROM_CAP_WIDTH, y:0, width:width, height:height));
        label.textAlignment = .center;
        label.font = FROM_SEARCH_FONTSIZE;
        label.text = text;
        label.textColor = rgbColor_FromHex(rgbValue: hexColor);
        self.addSubview(label);
        
        if img != nil {
            if img!.count > 0 {
                imgView = UIImageView.init(frame: CGRect.init(x:label.frame.origin.x + label.frame.size.width + FROM_CAP_WIDTH, y:(height - FROM_IMG_WIDTH)/2.0, width:imgWidth, height:imgWidth));
                imgView!.image = UIImage(named: "header");
                imgView!.layer.cornerRadius = 1;
                imgView!.layer.borderWidth = 0.5;
                imgView!.layer.borderColor = BORDER_COLOR.cgColor;
                imgView!.clipsToBounds = true;
                self.addSubview(imgView!);
            }
        }
        
        if needBorder {
            self.layer.borderColor = rgbColor_FromHex(rgbValue: hexColor).cgColor;
            self.layer.cornerRadius = 2;
            self.layer.borderWidth = 0.5;
        }else {
            
        }
        debug();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func debug() {
//        self.backgroundColor = rgbColor(250, 250, 250);
//        label.backgroundColor = rgbColor(230, 230, 230);
    }
}
