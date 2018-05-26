//
//  ListCell.swift
//  TINI
//
//  Created by TOOS on 18/4/15.
//  Copyright © 2018年 TOOS. All rights reserved.
//

import UIKit

let CANCEL_CONTACT_BTN_WIDTH:CGFloat = 30.0;
let LIST_CAP_WIDTH:CGFloat = 10.0;
let LIANZAI_VIEW_HEIGHT:CGFloat = 28.0;
let VIDEO_VIEW_HEIGHT:CGFloat = 90.0;
let SINGLE_IMAGE_WIDTH:CGFloat = 70;
let SINGLE_IMAGE_HEIGHT:CGFloat = 130.0;
let MUTRIBLE_IMAGE_HEIGHT:CGFloat = 70.0;
let IMAGE_CAP_WIDTH:CGFloat = 3.0;
let FROM_HEIGHT:CGFloat = 10.0;
let LIST_IMAGE_WIDTH:CGFloat = 60.0;
let LIST_IMG_BORDER_COLOR:UIColor = rgbColor_FromHex(rgbValue: 0xD8D8D8);

@objc protocol ListCellDelegate {
    func cancelContact(listId:Int64);
    func selectCell(listId:Int64);
}

class ListCell: UITableViewCell {
    
    private var editorImgView:UIImageView!
    private var editorNameLb:UILabel!
    private var cancelContentBtn:UIButton!
    private var titleLb:UILabel!
    private var contentLb:UILabel!
    private var contentImgView:UIImageView?
    private var commentImgView:UIImageView!
    private var commentCountLb:UILabel!
    private var friendingImgView:UIImageView!
    private var friendingCountLb:UILabel!
    private var admireImgView:UIImageView?
    private var admireCountLb:UILabel?
    private var dateLb:UILabel!
    
    weak var delegate:ListCellDelegate?
    private var listInfo:SearchListInfo?
    
    deinit {
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier:reuseIdentifier);
        self.selectionStyle = UITableViewCellSelectionStyle.none;
        editorImgView = UIImageView.init(frame: CGRect.init(x:LIST_CAP_WIDTH, y:LIST_CAP_WIDTH, width:20, height:20));
        editorImgView.image = UIImage(named: "header");
        editorImgView.layer.cornerRadius = editorImgView.frame.size.height/2.0;
        editorImgView.layer.borderWidth = 1.0;
        editorImgView.layer.borderColor = BORDER_COLOR.cgColor;
        editorImgView.clipsToBounds = true;
        self.contentView.addSubview(editorImgView);
        
        editorNameLb = UILabel.init(frame: CGRect.init(x:editorImgView.frame.origin.x + editorImgView.frame.size.width + LIST_CAP_WIDTH/2.0, y:LIST_CAP_WIDTH, width:UIScreen.main.bounds.size.width - (editorImgView.frame.origin.x + editorImgView.frame.size.width + LIST_CAP_WIDTH/2.0) - (2*LIST_CAP_WIDTH + CANCEL_CONTACT_BTN_WIDTH), height:20));
        editorNameLb.textAlignment = .left;
        editorNameLb.font = EDITOR_SEARCH_FONTSIZE;
        editorNameLb.text = "";
        editorNameLb.textColor = EDITOR_SEARCH_COLOR;
        
        self.contentView.addSubview(editorNameLb);
        
        cancelContentBtn = UIButton.init(frame: CGRect.init(x:UIScreen.main.bounds.size.width - (LIST_CAP_WIDTH + CANCEL_CONTACT_BTN_WIDTH), y:LIST_CAP_WIDTH, width:CANCEL_CONTACT_BTN_WIDTH, height:20));
        cancelContentBtn.setImage(UIImage(named: "cancel_contact"), for: .normal);
        cancelContentBtn.addTarget(self, action: #selector(cancelContact), for: .touchUpInside);
        self.contentView.addSubview(cancelContentBtn);
        
        titleLb = UILabel.init(frame: CGRect.init(x:LIST_CAP_WIDTH, y:editorImgView.frame.origin.y + editorImgView.frame.size.height + LIST_CAP_WIDTH/2.0, width:UIScreen.main.bounds.size.width - 2*LIST_CAP_WIDTH, height:23));
        titleLb.textAlignment = .left;
        titleLb.font = TITLE_SEARCH_FONTSIZE;
        titleLb.text = "";
        titleLb.textColor = TITLE_SEARCH_COLOR;
        
        self.contentView.addSubview(titleLb);
        
        contentLb = UILabel.init(frame: CGRect.init(x:LIST_CAP_WIDTH, y:titleLb.frame.origin.y + titleLb.frame.size.height + LIST_CAP_WIDTH/2.0, width:UIScreen.main.bounds.size.width - 2*LIST_CAP_WIDTH, height:28));
        contentLb.textAlignment = .left;
        contentLb.font = CONTENT_SEARCH_FONTSIZE;
        contentLb.text = "";
        contentLb.numberOfLines = 2;
        contentLb.lineBreakMode = .byTruncatingTail;
        contentLb.textColor = CONTENT_SEARCH_COLOR;
        self.contentView.addSubview(contentLb);
        
        let originY = contentLb.frame.origin.y + contentLb.frame.size.height + LIST_CAP_WIDTH/2.0;
        
        var originX = LIST_CAP_WIDTH;
        
        commentImgView = UIImageView.init(frame: CGRect.init(x:originX,  y:originY, width:FROM_HEIGHT, height:FROM_HEIGHT));
        commentImgView.image = UIImage(named: "header");
        commentImgView.layer.cornerRadius = 2.0;
        self.contentView.addSubview(commentImgView);
        
        originX += commentImgView.frame.size.width + LIST_CAP_WIDTH/2.0;
        
        commentCountLb = UILabel.init(frame: CGRect.init(x:originX, y:originY, width:width_for_text(textStr: "0", font: CONTENT_SEARCH_FONTSIZE, height: FROM_HEIGHT), height:FROM_HEIGHT));
        commentCountLb.textAlignment = .center;
        commentCountLb.font = CONTENT_SEARCH_FONTSIZE;
        commentCountLb.text = "0";
        commentCountLb.numberOfLines = 1;
        commentCountLb.lineBreakMode = .byWordWrapping;
        commentCountLb.textColor = CONTENT_SEARCH_COLOR;
        self.contentView.addSubview(commentCountLb);
        
        originX += commentCountLb.frame.size.width + LIST_CAP_WIDTH/2.0;
        
        friendingImgView = UIImageView.init(frame: CGRect.init(x:originX,  y:originY, width:FROM_HEIGHT, height:FROM_HEIGHT));
        friendingImgView.image = UIImage(named: "header");
        friendingImgView.layer.cornerRadius = 2.0;
        self.contentView.addSubview(friendingImgView);
        
        originX += friendingImgView.frame.size.width + LIST_CAP_WIDTH/2.0;
        
        friendingCountLb = UILabel.init(frame: CGRect.init(x:originX, y:originY, width:width_for_text(textStr: "0", font: CONTENT_SEARCH_FONTSIZE, height: FROM_HEIGHT), height:FROM_HEIGHT));
        friendingCountLb.textAlignment = .center;
        friendingCountLb.font = CONTENT_SEARCH_FONTSIZE;
        friendingCountLb.text = "0";
        friendingCountLb.numberOfLines = 1;
        friendingCountLb.lineBreakMode = .byWordWrapping;
        friendingCountLb.textColor = CONTENT_SEARCH_COLOR;
        self.contentView.addSubview(friendingCountLb);
        
        let time:String = "2010.10.31";
        let date_width:CGFloat = width_for_text(textStr: time, font: CONTENT_SEARCH_FONTSIZE, height: FROM_HEIGHT);
        dateLb = UILabel.init(frame: CGRect.init(x:UIScreen.main.bounds.size.width - date_width - LIST_CAP_WIDTH, y:originY, width:date_width, height:FROM_HEIGHT));
        dateLb.textAlignment = .center;
        dateLb.font = CONTENT_SEARCH_FONTSIZE;
        dateLb.text = time;
        dateLb.numberOfLines = 1;
        dateLb.lineBreakMode = .byWordWrapping;
        dateLb.textColor = CONTENT_SEARCH_COLOR;
        self.contentView.addSubview(dateLb);
        
        debug();
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated);
//        if((self.listInfo?.readStatus) == false) {
//           self.delegate?.selectCell((listInfo?.listId)!);
//        }
    }
    
    func debug() {
        //editorNameLb.backgroundColor = rgbColor(100, 100, 100);
        //titleLb.backgroundColor = rgbColor(100, 100, 100);
        //contentLb.backgroundColor = rgbColor(100, 100, 100);
        //commentCountLb.backgroundColor = rgbColor(100, 100, 100);
        //friendingCountLb.backgroundColor = rgbColor(100, 100, 100);
    }
    
    func setData(listData: SearchListInfo) {
        self.listInfo = listData;
        
        if (self.listInfo?.contentInfo.editor.count)! > 0 {
            editorNameLb.text = self.listInfo?.contentInfo.editor;
        }else {
            editorNameLb.text = "匿名";
        }
        if self.listInfo!.contentInfo.title.count > 0 {
            titleLb.text = self.listInfo!.contentInfo.title;
        }
        
        if self.listInfo!.contentInfo.content_text.count > 0 {
            contentLb.text = self.listInfo!.contentInfo.content_text;
        }
        
        if (self.listInfo!.contentInfo.imageInfo?.count)! > 0 {
            let w = UIScreen.main.bounds.width - 2*LIST_CAP_WIDTH - LIST_IMAGE_WIDTH;
            let heightForTitle = height_for_text(textStr: titleLb.text!, font: titleLb.font, width: w);
            titleLb.frame = CGRect.init(x:titleLb.frame.origin.x, y:titleLb.frame.origin.y, width:w, height:heightForTitle);
            
            let heightForContent = height_for_text(textStr: contentLb.text!, font: contentLb.font, width: w);
            contentLb.frame = CGRect.init(x:contentLb.frame.origin.x, y:titleLb.frame.origin.y + titleLb.frame.size.height + LIST_CAP_WIDTH/2.0, width:w, height:heightForContent);
            
            if contentImgView == nil {
                contentImgView = UIImageView.init(frame: CGRect.init(x:UIScreen.main.bounds.width - LIST_CAP_WIDTH - LIST_IMAGE_WIDTH, y:cancelContentBtn.frame.origin.y+cancelContentBtn.frame.size.height + LIST_CAP_WIDTH/2.0, width:LIST_IMAGE_WIDTH, height:LIST_IMAGE_WIDTH));
                contentImgView!.layer.cornerRadius = 2.0;
                contentImgView!.layer.borderWidth = 0.5;
                contentImgView!.layer.borderColor = LIST_IMG_BORDER_COLOR.cgColor;
                contentImgView!.clipsToBounds = true;
                self.contentView.addSubview(contentImgView!);
            }
            contentImgView?.isHidden = false;
            let imgInfo = self.listInfo!.contentInfo.imageInfo?[0] as! ImageInfo;
            contentImgView?.image = UIImage(named: imgInfo.img_url);
            
        }else {
            titleLb.frame = CGRect.init(x:titleLb.frame.origin.x, y:titleLb.frame.origin.y, width:UIScreen.main.bounds.size.width - 2*LIST_CAP_WIDTH, height:23);
            contentLb.frame = CGRect.init(x:contentLb.frame.origin.x, y:titleLb.frame.origin.y + titleLb.frame.size.height + LIST_CAP_WIDTH/2.0, width:UIScreen.main.bounds.size.width - 2*LIST_CAP_WIDTH, height:28);
            if contentImgView != nil {
                contentImgView?.isHidden = true;
            }
        }
        
        if self.listInfo!.list_type == List_Type.LT_TEXT  {
            
        }else if self.listInfo!.list_type == List_Type.LT_AUDIO {
            if self.listInfo?.audioInfo != nil {
                let h = ListCell.height_For_listData(listData: self.listInfo!) - (FROM_HEIGHT + LIST_CAP_WIDTH + LIANZAI_VIEW_HEIGHT + LIST_CAP_WIDTH/2.0);
                let commonView = CommonView.init(frame: CGRect.init(x:LIST_CAP_WIDTH, y:h, width:UIScreen.main.bounds.size.width - 2*LIST_CAP_WIDTH, height:LIANZAI_VIEW_HEIGHT), commonInfo: (self.listInfo?.audioInfo)!);
                self.contentView.addSubview(commonView);
            }
        }else if self.listInfo!.list_type == List_Type.LT_VIDEO {
            if self.listInfo?.videoInfo != nil {
                let h = ListCell.height_For_listData(listData: self.listInfo!) - (FROM_HEIGHT + LIST_CAP_WIDTH + LIANZAI_VIEW_HEIGHT + LIST_CAP_WIDTH/2.0);
                let commonView = CommonView.init(frame: CGRect.init(x:LIST_CAP_WIDTH, y:h, width:UIScreen.main.bounds.size.width - 2*LIST_CAP_WIDTH, height:LIANZAI_VIEW_HEIGHT), commonInfo: (self.listInfo?.videoInfo)!);
            self.contentView.addSubview(commonView);
            }
        }else if self.listInfo!.list_type == List_Type.LT_BOOK {
                if self.listInfo?.bookInfo != nil {
                    let h = ListCell.height_For_listData(listData: self.listInfo!) - (FROM_HEIGHT + LIST_CAP_WIDTH + LIANZAI_VIEW_HEIGHT + LIST_CAP_WIDTH/2.0);
                    let commonView = CommonView.init(frame: CGRect.init(x:LIST_CAP_WIDTH, y:h, width:UIScreen.main.bounds.size.width - 2*LIST_CAP_WIDTH, height:LIANZAI_VIEW_HEIGHT), commonInfo: (self.listInfo?.bookInfo)!);
            self.contentView.addSubview(commonView);
            }
        }else if self.listInfo!.list_type == List_Type.LT_IMAGE {
            
        }
        
        var originX:CGFloat = LIST_CAP_WIDTH;
        let originY:CGFloat = ListCell.height_For_listData(listData: self.listInfo!) - (FROM_HEIGHT + LIST_CAP_WIDTH);
        
        if self.listInfo!.from != nil {
            if self.listInfo!.from!.count > 0 {
                let from = listData.from![0] as! FromInfo;
                
                var needBorder:Bool = false;
                if from.from == From_Type.FT_LIANZAI {
                    if self.listInfo?.lianZaiInfo != nil {
                        let h = ListCell.height_For_listData(listData: self.listInfo!) - (FROM_HEIGHT + LIST_CAP_WIDTH + LIANZAI_VIEW_HEIGHT + LIST_CAP_WIDTH/2.0);
                        let commonView = CommonView.init(frame: CGRect.init(x:LIST_CAP_WIDTH, y:h, width:UIScreen.main.bounds.size.width - 2*LIST_CAP_WIDTH, height:LIANZAI_VIEW_HEIGHT), commonInfo: (self.listInfo?.lianZaiInfo)!);
                        self.contentView.addSubview(commonView);
                    }
                    
                    needBorder = false;
                }else {
                    needBorder = true;
                }
                let img_url = from.from_img_url;
                
                let fromView = FromView.init(point: CGPoint.init(x:originX, y:originY), height: FROM_HEIGHT, text: from.from_title, img: img_url, needBorder: needBorder, hexColor: from.hex_color);
                self.contentView.addSubview(fromView);
                
                originX += fromView.frame.size.width + LIST_CAP_WIDTH/2.0;
            }
        }
        
        if self.listInfo!.comment != nil {
            if self.listInfo!.comment!.count > 0 {
                let count = self.listInfo!.comment!.count;
                let countStr:String = "\(count)";
                commentImgView.frame = CGRect.init(x:originX, y:originY, width:FROM_HEIGHT, height:FROM_HEIGHT);
                
                originX += commentImgView.frame.size.width + LIST_CAP_WIDTH/2.0;
                
                commentCountLb.frame = CGRect.init(x:originX, y:originY, width:width_for_text(textStr: countStr, font: commentCountLb.font, height: FROM_HEIGHT), height:FROM_HEIGHT);
                commentCountLb.text = countStr;
                
                originX += commentCountLb.frame.size.width + LIST_CAP_WIDTH/2.0;
            }
        }else {
            commentImgView.frame = CGRect.init(x:originX, y:originY, width:FROM_HEIGHT, height:FROM_HEIGHT);
            
            originX += commentImgView.frame.size.width + LIST_CAP_WIDTH/2.0;
            
            commentCountLb.frame = CGRect.init(x:originX, y:originY, width:width_for_text(textStr: "0", font: commentCountLb.font, height: FROM_HEIGHT), height:FROM_HEIGHT);
            commentCountLb.text = "0";
            
            originX += commentCountLb.frame.size.width + LIST_CAP_WIDTH/2.0;
        }
        
        if self.listInfo!.friending != nil {
            if self.listInfo!.friending!.count > 0 {
                let count = self.listInfo!.friending!.count;
                let countStr:String = "\(count)";
                friendingImgView.frame = CGRect.init(x:originX, y:originY, width:FROM_HEIGHT, height:FROM_HEIGHT);
                originX += friendingImgView.frame.size.width + LIST_CAP_WIDTH/2.0;
                friendingCountLb.frame = CGRect.init(x:originX, y:originY, width:width_for_text(textStr: countStr, font: friendingCountLb.font, height: FROM_HEIGHT), height:FROM_HEIGHT);
                friendingCountLb.text = countStr;
                
                originX += friendingCountLb.frame.size.width + LIST_CAP_WIDTH/2.0;
            }
        }else {
            friendingImgView.frame = CGRect.init(x:originX, y:originY, width:FROM_HEIGHT, height:FROM_HEIGHT);
            originX += friendingImgView.frame.size.width + LIST_CAP_WIDTH/2.0;
            friendingCountLb.frame = CGRect.init(x:originX, y:originY, width:width_for_text(textStr: "0", font: friendingCountLb.font, height: FROM_HEIGHT), height:FROM_HEIGHT);
            friendingCountLb.text = "0";
            originX += friendingCountLb.frame.size.width + LIST_CAP_WIDTH/2.0;
        }
        
        if self.listInfo!.admire != nil {
            if self.listInfo!.admire!.count > 0 {
                let count = self.listInfo!.admire!.count;
                let countStr:String = "\(count)";
                
                if admireImgView == nil {
                    admireImgView = UIImageView.init(frame: CGRect.init(x:originX,  y:originY, width:FROM_HEIGHT, height:FROM_HEIGHT));
                    admireImgView!.image = UIImage(named: "header");
                    admireImgView!.layer.cornerRadius = 2.0;
                    self.contentView.addSubview(admireImgView!);
                }else {
                    admireImgView?.frame = CGRect.init(x:originX, y:originY, width:FROM_HEIGHT, height:FROM_HEIGHT);
                }
                originX += admireImgView!.frame.size.width + LIST_CAP_WIDTH/2.0;
                admireImgView?.isHidden = false;
                
                if admireCountLb == nil {
                    admireCountLb = UILabel.init(frame: CGRect.init(x:originX, y:originY, width:width_for_text(textStr: countStr, font: CONTENT_SEARCH_FONTSIZE, height: FROM_HEIGHT), height:FROM_HEIGHT));
                    admireCountLb!.textAlignment = .center;
                    admireCountLb!.font = CONTENT_SEARCH_FONTSIZE;
                    admireCountLb!.numberOfLines = 1;
                    admireCountLb!.lineBreakMode = .byWordWrapping;
                    admireCountLb!.textColor = CONTENT_SEARCH_COLOR;
                    self.contentView.addSubview(admireCountLb!);
                }
                else {
                    admireCountLb?.frame = CGRect.init(x:originX, y:originY, width:width_for_text(textStr: countStr, font: CONTENT_SEARCH_FONTSIZE, height: FROM_HEIGHT), height: FROM_HEIGHT);
                }
                admireCountLb?.isHidden = false;
                admireCountLb!.text = countStr;
            }
        }else {
            if admireImgView != nil {
                admireImgView?.isHidden = true;
            }
            if admireCountLb != nil {
                admireCountLb?.isHidden = true;
            }
        }
        
        if (self.listInfo?.publish_date)! > 0.0 {
            let timeStr = dateStringFromTimeStamp(timeStamp: (self.listInfo?.publish_date)!);
            let dateWidth = width_for_text(textStr: timeStr, font: dateLb.font, height: FROM_HEIGHT);
            dateLb.frame = CGRect.init(x:UIScreen.main.bounds.size.width - dateWidth - LIST_CAP_WIDTH, y:originY, width:dateWidth, height:FROM_HEIGHT);
            dateLb.text = timeStr;
        }
        self.layoutSubviews();
    }
    
    @objc func cancelContact(button:UIButton) {
        self.delegate?.cancelContact(listId: (listInfo?.sourceId)!);
    }
    
    static func height_For_listData(listData: SearchListInfo) -> CGFloat {
        if listData.sourceId <= 0 {return 100;}
        
        var height:CGFloat = 0.0;
        
        height += LIST_CAP_WIDTH;
        
        if listData.contentInfo.editor.count >= 0  {
            height += 20;
            height += LIST_CAP_WIDTH/2.0;
        }
        
        if (listData.contentInfo.imageInfo?.count)! > 0 {
            var height1 = height;
            height1 += 23;
            height1 += LIST_CAP_WIDTH/2.0;
            height1 += 28;
            height1 += LIST_CAP_WIDTH/2.0;
            
            let w = UIScreen.main.bounds.width - 2*LIST_CAP_WIDTH - LIST_IMAGE_WIDTH;
            let heightForTitle = height_for_text(textStr: listData.contentInfo.title, font: TITLE_SEARCH_FONTSIZE, width: w);
            height += heightForTitle;
            height += LIST_CAP_WIDTH/2.0;
            
            let heightForContent = height_for_text(textStr: listData.contentInfo.content_text, font: CONTENT_SEARCH_FONTSIZE, width: w);
            height += heightForContent;
            height += LIST_CAP_WIDTH/2.0;
            
            if height < height1 {
                height = height1;
            }
        }else {
            if listData.contentInfo.title.count > 0 {
                height += 23;
                height += LIST_CAP_WIDTH/2.0;
            }
            
            if listData.contentInfo.content_text.count > 0 {
                height += 28;
                height += LIST_CAP_WIDTH/2.0;
            }
        }
        
        if listData.list_type == List_Type.LT_TEXT  {
            
        }else if listData.list_type == List_Type.LT_AUDIO {
            height += LIANZAI_VIEW_HEIGHT;
            height += LIST_CAP_WIDTH/2.0;
        }else if listData.list_type == List_Type.LT_VIDEO {
            height += VIDEO_VIEW_HEIGHT;
            height += LIST_CAP_WIDTH/2.0;
        }else if listData.list_type == List_Type.LT_BOOK {
            height += LIANZAI_VIEW_HEIGHT;
            height += LIST_CAP_WIDTH/2.0;
        }else if listData.list_type == List_Type.LT_IMAGE {
//            if listData.imageInfo!.count == 1 {
//                height += SINGLE_IMAGE_HEIGHT;
//                height += LIST_CAP_WIDTH/2.0;
//            }else {
//                let image_count = listData.imageInfo!.count;
//                if image_count <= 3 {
//                    height += MUTRIBLE_IMAGE_HEIGHT;
//                }else if image_count <= 6 && image_count > 3 {
//                    height += 2*MUTRIBLE_IMAGE_HEIGHT + IMAGE_CAP_WIDTH;
//                }else if image_count > 6 && image_count <= 9 {
//                    height += 3*MUTRIBLE_IMAGE_HEIGHT + 2*IMAGE_CAP_WIDTH;
//                }
//                height += LIST_CAP_WIDTH/2.0;
//            }
        }
        
        height += FROM_HEIGHT;
            
        if listData.from != nil {
            let from = listData.from![0] as! FromInfo;
            if from.from == From_Type.FT_LIANZAI {
                height += LIST_CAP_WIDTH;
                height += LIANZAI_VIEW_HEIGHT;
                height += LIST_CAP_WIDTH;
            }else {
                height += LIST_CAP_WIDTH;
            }
        }else {
            height += LIST_CAP_WIDTH;
        }
        
        return height;
    }
}
