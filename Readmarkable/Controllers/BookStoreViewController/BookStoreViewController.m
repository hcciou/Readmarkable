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
#import "BookModel.h"

@interface BookStoreViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) BookStoreTableView* bookStoreTableView;
@property (nonatomic) BookStoreTableViewCell* bookStoreTableViewCell;
@property (nonatomic) BookModel* book;
@property (nonatomic) NSArray* booksArray;
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
    self.booksArray = [self.book parseBookJSON];
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
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString: kColorMainCyan];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.navigationBar.translucent = NO;
//    self.view.backgroundColor = [UIColor colorWithHexString: kColorMainCyan];
    
}

#pragma mark - getter/setter

//- (void)setBooksArray:(NSArray *)booksArray
//{
//    _booksArray = booksArray;
//}

- (BookModel *)book
{
    if (!_book) {
        _book = [[BookModel alloc] init];
    }
    return _book;
}

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
//    return self.booksArray.count;
    return 5;
}

- (BookStoreTableViewCell *)tableView:(BookStoreTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BookStoreTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"bookstoreCellID"];
    if (!_bookStoreTableViewCell)
    {
        cell = [[BookStoreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"bookstoreCellID"];
    }
    
    BookModel* books = [[BookModel alloc] init];
    if (indexPath.row < 3) {
        books = self.booksArray[indexPath.row];
        cell.photoImage.image = [UIImage imageNamed: books.cover];
        cell.bookNameLabel.text = books.title;
        cell.authorLabel.text = books.author;
        cell.updateLabel.text = @"更新日期：2014/04/11";
    }

    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BookModel* books = [[BookModel alloc] init];
    
    if (indexPath.row < 3) {
        books = self.booksArray[indexPath.row];
        DetailViewController* nextVC = [[DetailViewController alloc] init];
        nextVC.book = books;
        
        [self.navigationController pushViewController:nextVC animated:YES];
    }
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
