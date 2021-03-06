//
//  File.swift
//  SwiftTest
//
//  Created by TOOS on 18/4/14.
//  Copyright © 2018年 TOOS. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,
UITableViewDataSource,
UITableViewDelegate,
ListCellDelegate
{
    var tableView: ListView!
    private var list:NSMutableArray!
    let header = MJRefreshNormalHeader()
    
    deinit {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var height:CGFloat = 0.0;
        if(UIDevice.current.isX()) {
            height = 88.0;
        }else {
            height = 64.0;
        }
        tableView = ListView.init(frame: CGRect.init(x:0.0, y:height, width:UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height - height - 50), style:UITableViewStyle.plain);
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView!.register(ListCell.self,
            forCellReuseIdentifier: "ListCell");
        self.view.addSubview(tableView);
        
        header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
        tableView.mj_header = header
        tableView.footerView(forSection: 0);
        
        debug();
    }
    
    func debug() {
        let searchInfo1 = SearchListInfo.init();
        
        searchInfo1.sourceId = 1;
        searchInfo1.publish_date = 1463637809;
        
        let imgInfo = ImageInfo.init();
        imgInfo.editor = "Stephen";
        imgInfo.img_url = "https://gss0.bdstatic.com/94o3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike116%2C5%2C5%2C116%2C38/sign=79c6453232dbb6fd3156ed74684dc07d/aa64034f78f0f73687dfbdc80155b319eac413d1.jpg";
        imgInfo.sourceId = 6;
        imgInfo.publish_date = 1463637809;
        
        let content = ContentInfo.init();
        content.sourceId = 2;
        content.editor = "Stephen";
        content.title = "aaaaaa";
        
        let arr5:NSMutableArray = [imgInfo];
        content.imageInfo = arr5;
        
        content.content_text = "wodeleleleleleldfaweawefdsfsdsdfsfsaffasddffdfdfddfadsffdsaffafdfadsfafffaffasdfassfdddssadfasfasfasfasdfsdfasdfasffafs";
        content.editor_img_url = "https://gss0.bdstatic.com/94o3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike116%2C5%2C5%2C116%2C38/sign=79c6453232dbb6fd3156ed74684dc07d/aa64034f78f0f73687dfbdc80155b319eac413d1.jpg";
        
        let from1 = FromInfo.init();
        from1.sourceId = 3;
        from1.from = From_Type.FT_LIANZAI;
        from1.from_title = "lianzai";
        from1.from_img_url = "https://gss0.bdstatic.com/94o3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike116%2C5%2C5%2C116%2C38/sign=79c6453232dbb6fd3156ed74684dc07d/aa64034f78f0f73687dfbdc80155b319eac413d1.jpg";
        from1.editor = "Stephen";
        from1.from_date = 1463637809;
        from1.last_modify_date = 1463637809;
        let arr1:NSMutableArray = [from1];
        
        let friending1 = FriendingInfo.init();
        friending1.friending_status = Friending_Sts.FS_NORMAL;
        friending1.friending_date = 1463637809;
        friending1.friendinger = "Stephen";
        friending1.sourceId = 4;
        let arr2:NSMutableArray = [friending1];
        
        let comment1 = CommentInfo.init();
        comment1.comment = "323";
        comment1.comment_date = 1463637809;
        comment1.comment_status = Comment_Sts.CS_PUBLISH;
        comment1.sourceId = 5;
        comment1.commentor = "bibl";
        let arr3:NSMutableArray = [comment1];
        
        let admire1 = AdmireInfo.init();
        admire1.admire_price = 1323;
        admire1.admire_date = 1463637809;
        admire1.admire_status = Admire_Sts.AS_SUCCESS;
        admire1.sourceId = 6;
        admire1.admirer = "3dddd";
        let arr4:NSMutableArray = [admire1];
        
        let lianZaiInfo = LianZaiInfo.init();
        lianZaiInfo.sourceId = 7;
        lianZaiInfo.editor = "stefwef";
        lianZaiInfo.from = [from1];
        lianZaiInfo.title = "dfefefaffeaasaf";
        lianZaiInfo.img_url = "https://gss0.bdstatic.com/94o3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike116%2C5%2C5%2C116%2C38/sign=79c6453232dbb6fd3156ed74684dc07d/aa64034f78f0f73687dfbdc80155b319eac413d1.jpg";
        lianZaiInfo.publish_date = 1463637809;
        searchInfo1.lianZaiInfo = lianZaiInfo;
            
        searchInfo1.contentInfo = content;
        searchInfo1.list_type = List_Type.LT_TEXT;
        searchInfo1.list_status = List_Status.LS_PUBLISH;
        searchInfo1.infoStatus = Info_Status.IS_PUBLIC;
        searchInfo1.from = arr1;
        searchInfo1.friending = arr2;
        searchInfo1.comment = arr3;
        searchInfo1.admire = arr4;
        list = [searchInfo1]
    }
    
    @objc func headerRefresh(){
        print("下拉刷新")
        tableView.mj_header.endRefreshing()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let listData:SearchListInfo = self.list[indexPath.row] as! SearchListInfo;
        return ListCell.height_For_listData(listData: listData);
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! ListCell
        cell.delegate = self;
        let listData:SearchListInfo = self.list[indexPath.row] as! SearchListInfo;
        cell.setData(listData: listData);
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if cell.respondsToSelector("UIView.layoutMargins") {
//            cell.layoutMargins = UIEdgeInsets.init()
//        }
//        if cell.respondsToSelector("UITableViewCell.separatorInset") {
//            cell.separatorInset = UIEdgeInsets.init()
//        }
    }
    
    func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
    func cancelContact(listId:Int64) {
        
    }
    
    func selectCell(listId:Int64) {
        
    }
}
