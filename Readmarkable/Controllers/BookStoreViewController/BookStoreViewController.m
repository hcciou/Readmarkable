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
    return 10;
}

- (BookStoreTableViewCell *)tableView:(BookStoreTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BookStoreTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"bookstoreCellID"];
    if (!_bookStoreTableViewCell) {
        cell = [[BookStoreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"bookstoreCellID"];
    }
    cell.textLabel.text = @"火影忍者";
    cell.imageView.image = [UIImage imageNamed:@"naruto"];

    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
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
