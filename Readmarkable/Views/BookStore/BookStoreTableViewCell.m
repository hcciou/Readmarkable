//
//  BookStoreTableViewCell.m
//  Readmarkable
//
//  Created by hcc on 2014/3/18.
//  Copyright (c) 2014年 hcc. All rights reserved.
//

#import "BookStoreTableViewCell.h"

@interface BookStoreTableViewCell()
@property ( nonatomic, strong) UIImageView* photoImage;
@property ( nonatomic, strong) UILabel* bookNameLabel;
@property ( nonatomic, strong) UILabel* authorLabel;
@end

@implementation BookStoreTableViewCell

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
    [self addSubview: self.photoImage];
    [self addSubview: self.bookNameLabel];
    [self addSubview: self.authorLabel];
}

- (UIImageView *)photoImage
{
    if (!_photoImage) {
        _photoImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"kinfolk"]];
        _photoImage.frame = CGRectMake( 10, 10, 86, 120);
    }
    return _photoImage;
}

- (UILabel *)bookNameLabel
{
    if (!_bookNameLabel) {
        _bookNameLabel = [[UILabel alloc] initWithFrame: CGRectMake( 110, 10, 200, 50)];
        _bookNameLabel.font = [UIFont systemFontOfSize:20];
        _bookNameLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _bookNameLabel.numberOfLines = 0;
        _bookNameLabel.textColor = [UIColor colorWithHexString:kColorFontCyan];
        _bookNameLabel.text = @"KINFOLK餐桌：獻給生活中的每一場小聚會";
    }
    return _bookNameLabel;
}

- (UILabel *)authorLabel
{
    if (!_authorLabel) {
        _authorLabel = [[UILabel alloc] initWithFrame: CGRectMake(110, 50, 200, 70)];
        _authorLabel.font = [UIFont systemFontOfSize:20];
        _authorLabel.textColor = [UIColor colorWithHexString: kColorFontCyan];
        _authorLabel.text = @"奈森‧威廉斯";
    }
    return _authorLabel;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
