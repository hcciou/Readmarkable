//
//  ContentViewController.m
//  Readmarkable
//
//  Created by hcc on 2014/4/14.
//  Copyright (c) 2014年 hcc. All rights reserved.
//

#import "ContentViewController.h"

@interface ContentViewController ()<UIPageViewControllerDelegate>
@end

@implementation ContentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupLayout];
    // Do any additional setup after loading the view.
}

- (void)setupLayout
{
    self.view.backgroundColor = [UIColor colorWithHexString:kColorMainCyan];
    
}

- (void)readContent
{
    NSString* path = [[NSBundle mainBundle] pathForResource:@"The_Metamorphosis"
                                                     ofType:@"txt"];
    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    NSLog(@"%@",path);

//    NSLog(@"%@",content);
//    NSLog(@"File content : %@ ", strFileContent);

}

@end
