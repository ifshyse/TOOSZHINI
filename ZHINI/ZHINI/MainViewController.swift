//
//  ViewController.swift
//  SwiftTest
//
//  Created by TOOS on 18/4/14.
//  Copyright © 2018年 TOOS. All rights reserved.
//

import UIKit

class MainViewController: UINavigationController,
YBTabViewProtocol
{

    var tabViewController:YBTabViewController!
    var navigationBarView: YBNavigationBar!
    
    deinit {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let storyboard = UIStoryboard(name: "YBTabViewController", bundle: NSBundle.mainBundle());
        tabViewController = storyboard.instantiateViewControllerWithIdentifier("YBTabViewController") as! YBTabViewController;
        tabViewController.ybprotocol = self;
        showDisplayViewController(self, contentViewController: tabViewController);
        
        var height:CGFloat = 0.0;
        if(UIDevice.currentDevice().isX()) {
            height = 88.0;
        }else {
            height = 64.0;
        }
        navigationBarView = YBNavigationBar.init(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, height));
        navigationBarView.setBackgroundViewColor(254,g: 254,b: 254);
        self.view.addSubview(navigationBarView);
        navigationBarView.setTitle("发现");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(animated: Bool) {
        hideDisplayViewController(self, contentViewController: tabViewController);
        super.viewDidAppear(animated);
    }
    func setNavigationTitle(title:String) {
        navigationBarView.setTitle(title);
    }
}

