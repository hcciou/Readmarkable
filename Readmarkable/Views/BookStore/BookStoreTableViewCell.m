//
//  BookStoreTableViewCell.m
//  Readmarkable
//
//  Created by hcc on 2014/3/18.
//  Copyright (c) 2014年 hcc. All rights reserved.
//

#import "BookStoreTableViewCell.h"

@interface BookStoreTableViewCell()
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
    [self addSubview: self.updateLabel];
}

- (UIImageView *)photoImage
{
    if (!_photoImage) {
        _photoImage = [[UIImageView alloc] initWithFrame: CGRectMake(10, 10, 86, 120)];
        _photoImage.image = [UIImage imageNamed:@"bookDefault"];
    }
    return _photoImage;
}

- (UILabel *)bookNameLabel
{
    if (!_bookNameLabel) {
        _bookNameLabel = [[UILabel alloc] initWithFrame: CGRectMake( 110, 30, 200, 20)];
        _bookNameLabel.font = [UIFont systemFontOfSize:20];
        _bookNameLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _bookNameLabel.numberOfLines = 0;
        _bookNameLabel.textColor = [UIColor redColor];
        _bookNameLabel.text = @"新書上架中";
    }
    return _bookNameLabel;
}

- (UILabel *)authorLabel
{
    if (!_authorLabel) {
        _authorLabel = [[UILabel alloc] initWithFrame: CGRectMake(110, 60, 200, 20)];
        _authorLabel.font = [UIFont systemFontOfSize:20];
        _authorLabel.textColor = [UIColor colorWithHexString: kColorFontCyan];
    }
    return _authorLabel;
}

- (UILabel *)updateLabel
{
    if (!_updateLabel) {
        _updateLabel = [[UILabel alloc] initWithFrame: CGRectMake(165, 110, 200, 20)];
        _updateLabel.textColor = [UIColor grayColor];
        _updateLabel.font = [UIFont systemFontOfSize: 14];
    }
    return _updateLabel;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
