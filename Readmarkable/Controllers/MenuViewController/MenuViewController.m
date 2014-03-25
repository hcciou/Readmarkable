//
//  MenuViewController.m
//  Readmarkable
//
//  Created by hcc on 2014/3/25.
//  Copyright (c) 2014年 hcc. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuTableView.h"
#import "MenuTableViewCell.h"
@interface MenuViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) MenuTableView* tableView;
@property (nonatomic, strong) MenuTableViewCell* tableViewCell;
@property (nonatomic, strong) NSArray* array;
@end

@implementation MenuViewController

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
    [self.view addSubview: self.tableView];
    [self.view addSubview: self.tableViewCell];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - getter

- (NSArray *)array
{
    return @[@"書庫", @"朋友", @"設定"];
}

- (MenuTableView *)tableView
{
    if (!_tableView) {
        _tableView = [[MenuTableView alloc] initWithFrame: self.view.frame];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(MenuTableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.array count];
}

- (MenuTableViewCell *)tableView:(MenuTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[MenuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    cell.textLabel.text = self.array[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
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
