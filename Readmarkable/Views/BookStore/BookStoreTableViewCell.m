//
//  BookStoreTableViewCell.m
//  Readmarkable
//
//  Created by hcc on 2014/3/18.
//  Copyright (c) 2014年 hcc. All rights reserved.
//

#import "BookStoreTableViewCell.h"

@implementation BookStoreTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
