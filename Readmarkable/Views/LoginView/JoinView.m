//
//  JoinView.m
//  Readmarkable
//
//  Created by hcc on 2014/3/15.
//  Copyright (c) 2014年 hcc. All rights reserved.
//

#import "JoinView.h"

@implementation JoinView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setLayout];
    }
    return self;
}

- (void) setLayout
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 10;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = 2;
    self.backgroundColor = [UIColor colorWithHexString: kColorMainCyan];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
