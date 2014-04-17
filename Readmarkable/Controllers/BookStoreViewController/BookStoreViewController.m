//
//  BookStoreViewController.m
//  Readmarkable
//
//  Created by hcc on 2014/3/17.
//  Copyright (c) 2014年 hcc. All rights reserved.
//

#import "BookStoreViewController.h"
#import <JASidePanelController.h>
#import "BookStoreTableView.h"
#import "BookStoreTableViewCell.h"
#import "DetailViewController.h"

@interface BookStoreViewController ()<UITableViewDataSource, UITableViewDelegate>
@property ( nonatomic, strong) BookStoreTableView* bookStoreTableView;
@property ( nonatomic, strong) BookStoreTableViewCell* bookStoreTableViewCell;
@end

@implementation BookStoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setLayout];
    [self.view addSubview: self.bookStoreTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setLayout
{
//    self.navigationController.navigationBarHidden = YES;
    self.title = @"書庫";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString: kColorMainCyan];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.navigationBar.translucent = NO;
//    self.view.backgroundColor = [UIColor colorWithHexString: kColorMainCyan];
    
}

#pragma mark - getter
- (BookStoreTableView *)bookStoreTableView
{
    if (!_bookStoreTableView) {
        CGRect frame = self.view.frame;
        _bookStoreTableView = [[BookStoreTableView alloc] initWithFrame: frame];
        // tableView 線不見
        _bookStoreTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _bookStoreTableView.delegate = self;
        _bookStoreTableView.dataSource = self;;
        
    }
    return _bookStoreTableView;
}

#pragma mark - DataSource Delegate

- (NSInteger)tableView:(BookStoreTableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (BookStoreTableViewCell *)tableView:(BookStoreTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BookStoreTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"bookstoreCellID"];
    if (!_bookStoreTableViewCell)
    {
        cell = [[BookStoreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"bookstoreCellID"];
    }
//    NSArray* imageArray = @[];
    cell.photoImage.image = [UIImage imageNamed:@"1037.jpg"];
    cell.bookNameLabel.text = @"1111";
    cell.authorLabel.text = @"2222";
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController* nextVC = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:nextVC animated:YES];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
