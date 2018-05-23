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
        let width = width_for_text(text, font: FROM_SEARCH_FONTSIZE, height: height);
        var imgWidth:CGFloat = 0;
        if img != nil {
            if img!.characters.count > 0 {
                imgWidth = FROM_IMG_WIDTH;
            }
        }
        super.init(frame: CGRectMake(point.x, point.y, 3*FROM_CAP_WIDTH + width + imgWidth, height));
        label = UILabel.init(frame: CGRectMake(FROM_CAP_WIDTH, 0, width, height));
        label.textAlignment = .Center;
        label.font = FROM_SEARCH_FONTSIZE;
        label.text = text;
        label.textColor = rgbColor_FromHex(hexColor);
        self.addSubview(label);
        
        if img != nil {
            if img!.characters.count > 0 {
                imgView = UIImageView.init(frame: CGRectMake(label.frame.origin.x + label.frame.size.width + FROM_CAP_WIDTH, (height - FROM_IMG_WIDTH)/2.0, imgWidth, imgWidth));
                imgView!.image = UIImage(named: "header");
                imgView!.layer.cornerRadius = 1;
                imgView!.layer.borderWidth = 0.5;
                imgView!.layer.borderColor = BORDER_COLOR.CGColor;
                imgView!.clipsToBounds = true;
                self.addSubview(imgView!);
            }
        }
        
        if needBorder {
            self.layer.borderColor = rgbColor_FromHex(hexColor).CGColor;
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
