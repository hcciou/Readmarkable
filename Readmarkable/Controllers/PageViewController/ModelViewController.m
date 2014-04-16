//
//  ModelViewController.m
//  Readmarkable
//
//  Created by hcc on 2014/4/16.
//  Copyright (c) 2014年 hcc. All rights reserved.
//

#import "ModelViewController.h"
#import "ContentViewController.h"

@interface ModelViewController ()

@end

@implementation ModelViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSLog(@"before");
    ContentViewController *currentViewController = (ContentViewController *)viewController;
    if (currentViewController.page<=0) {
        return nil;
    }
    NSInteger page = currentViewController.page-1;
    ContentViewController *contentController = [viewController.storyboard
                                                instantiateViewControllerWithIdentifier:@"ContentViewController"];
    contentController.content = [NSString stringWithFormat:@"Page %ld",(long)page];
    contentController.page = page;
    return contentController;
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSLog(@"after");
    ContentViewController *currentViewController = (ContentViewController *)viewController;
    if (currentViewController.page>=10) {
        return nil;
    }
    NSInteger page = currentViewController.page+1;
    
    ContentViewController *contentController = [viewController.storyboard
                                                instantiateViewControllerWithIdentifier:@"ContentViewController"];
    contentController.content = [NSString stringWithFormat:@"Page %ld",(long)page];
    contentController.page = page;
    
    return contentController;
}


@end
