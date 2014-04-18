//
//  BookStoreTableViewCell.h
//  Readmarkable
//
//  Created by hcc on 2014/3/18.
//  Copyright (c) 2014年 hcc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookStoreTableViewCell : UITableViewCell
@property ( nonatomic, strong) UIImageView* photoImage;
@property ( nonatomic, strong) UILabel* bookNameLabel;
@property ( nonatomic, strong) UILabel* authorLabel;
@property ( nonatomic, strong) UILabel* updateLabel;
@end
