//
//  BookInfo.swift
//  TINI
//
//  Created by TOOS on 18/4/15.
//  Copyright © 2018年 TOOS. All rights reserved.
//

import Foundation

enum BookType:String {
    case BT_OTHER = "other"
    case BT_YOUTH = "youth"                     //青春文学
    case BT_NOVEL = "novel"                     //小说
    case BT_LITERATURE = "literature"           //文学
    case BT_ART = "art"                         //艺术
    case BT_COMIC = "comic"                     //动漫
    case BT_FASHION = "fashion"                 //时尚
    case BT_TRAVEL = "travel"                   //旅游
    case BT_MAP_GEO = "map_geo"                 //地图/地理
    case BT_LIFE = "life"                       //生活
    case BT_SEX = "sex"                         //两性
    case BT_CHILD = "child"                     //少儿
    case BT_PHYCHOLOGY = "phychology"           //保健/心理健康
    case BT_PHYSICAL = "physical"               //体育
    case BT_MOTIVATION = "motivation"           //励志
    case BT_MANAGE = "manage"                   //管理
    case BT_ECOMONIC = "ecomonic"               //经济
    case BT_LAW = "law"                         //法律
    case BT_POLITICAL = "political"             //政治/军事
    case BT_PHILOSOPHY = "philosophy"           //哲学/宗教
    case BT_SOCIAL = "social"                   //社会科学
    case BT_OLD_BOOK = "old_book"               //古籍
    case BT_CULTURE = "culture"                 //文化
    case BT_HISTORY = "history"                 //历史
    case BT_BIOGRAPHY = "biography"             //传记
    case BT_BABY = "baby"                       //育儿
    case BT_TRAIN = "train"                     //教辅
    case BT_LANGUAGE = "language"               //语言
    case BT_TEST = "test"                       //考试
    case BT_TEXTBOOK = "textbook"               //教材
    case BT_TOOLBOOK = "toolbook"               //工具书
}

class BookInfo: CommonInfo {
    
    var book_url:String?
    var book_name:String!
    var book_img_url:String!
    var content:String!
    var detail_content:String?
    var book_type:BookType!
    
    deinit {
        
    }
    
    override init() {
        super.init()
        publish_date = 0;
        book_name = "";
        book_img_url = "";       //if not exist, system will distribute
        book_type = BookType.init(rawValue: "other");
        img_url = book_img_url;
        type = Common_TYPE.CT_BOOK;
    }
}