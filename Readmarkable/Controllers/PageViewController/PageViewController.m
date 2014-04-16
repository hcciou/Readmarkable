//
//  PageViewController.m
//  Readmarkable
//
//  Created by hcc on 2014/4/14.
//  Copyright (c) 2014年 hcc. All rights reserved.
//

#import "PageViewController.h"
#import "ModelViewController.h"
#import "ContentViewController.h"

@interface PageViewController ()<UIPageViewControllerDelegate>
@property (nonatomic, strong) UIPageViewController* pageVC;
@property (nonatomic, strong) ModelViewController* modelVC;
@end

@implementation PageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupLayout];
//    [self readBook];
    
    self.pageVC =[[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageVC.delegate = self;
    
    self.modelVC = [[ModelViewController alloc] init];
    self.pageVC.dataSource = self.modelVC;
    
    ContentViewController* content = [self.storyboard instantiateViewControllerWithIdentifier:@"ContentViewController"];
    [self.pageVC setViewControllers:[NSArray arrayWithObjects:content, nil] direction:0 animated:YES completion:nil];
    
    [self addChildViewController: self.pageVC];
    [self.view addSubview: self.pageVC.view];
    CGRect pageViewRect = self.view.bounds;
    self.pageVC.view.frame = pageViewRect;
    
    self.view.gestureRecognizers = self.pageVC.gestureRecognizers;
}

- (void)setupLayout
{
    self.view.backgroundColor = [UIColor colorWithHexString:kColorMainCyan];
}

- (void)readBook
{
    NSString* path = [[NSBundle mainBundle] pathForResource:@"The_Metamorphosis"
                                                     ofType:@"txt"];
    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    NSLog(@"%@",path);
    NSLog(@"%@",content);

}

@end
