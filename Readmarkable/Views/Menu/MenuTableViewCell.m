//
//  MenuTableViewCell.m
//  Readmarkable
//
//  Created by hcc on 2014/3/25.
//  Copyright (c) 2014年 hcc. All rights reserved.
//

#import "MenuTableViewCell.h"

@implementation MenuTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupLayout];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setupLayout
{
    self.backgroundColor = [UIColor greenColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
