//
//  YBMainViewController.swift
//  SwiftTest
//
//  Created by TOOS on 18/4/14.
//  Copyright © 2018年 TOOS. All rights reserved.
//

import UIKit

protocol YBTabViewProtocol {
    func setNavigationTitle(title:String);
}

class YBTabViewController: UITabBarController {
    
    var ybprotocol:YBTabViewProtocol?;
    
    deinit {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setItems();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    
    private func setItems() {
        self.tabBar.items![0].selectedImage = UIImage(named:"search_select");
        self.tabBar.items![0].image = UIImage(named:"search_unselect");
        self.tabBar.items![1].selectedImage = UIImage(named:"friending_select");
        self.tabBar.items![1].image = UIImage(named:"friending_unselect");
        self.tabBar.items![2].selectedImage = UIImage(named:"add_unselect.png");
        self.tabBar.items![2].image = UIImage(named:"add_unselect.png");
        self.tabBar.items![3].selectedImage = UIImage(named:"message_select");
        self.tabBar.items![3].image = UIImage(named:"message_unselect");
        self.tabBar.items![4].selectedImage = UIImage(named:"mine_select");
        self.tabBar.items![4].image = UIImage(named:"mine_unselect");
        self.tabBar.tintColor = TEXT_COLOR;
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.ybprotocol!.setNavigationTitle(title: item.title!);
    }
}
