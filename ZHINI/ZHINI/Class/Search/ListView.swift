//
//  ListView.swift
//  TINI
//
//  Created by TOOS on 18/4/14.
//  Copyright © 2018年 TOOS. All rights reserved.
//

import UIKit

class ListView: UITableView
{
    deinit {
        
    }
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style:style);
        rowHeight = 100;
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
