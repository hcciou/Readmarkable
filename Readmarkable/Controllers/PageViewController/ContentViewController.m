//
//  ContentViewController.m
//  Readmarkable
//
//  Created by hcc on 2014/4/16.
//  Copyright (c) 2014年 hcc. All rights reserved.
//

#import "ContentViewController.h"

@interface ContentViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end

@implementation ContentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.textView.text = self.content;
}

@end
