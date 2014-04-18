//
//  DetailViewController.m
//  Readmarkable
//
//  Created by hcc on 2014/4/12.
//  Copyright (c) 2014年 hcc. All rights reserved.
//

#import "DetailViewController.h"
#import "KFEpubViewController.h"
#import <UIView+AutoLayout.h>

@interface DetailViewController ()
@property (nonatomic, strong) UIImageView* coverImage;
@property (nonatomic, strong) UILabel* authorLabel;
@property (nonatomic, strong) UIButton* continueButton;
@property (nonatomic, strong) UITextView* introTextView;
@end

@implementation DetailViewController

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
    // Do any additional setup after loading the view.
    [self setupLayout];
    [self.view addSubview: self.coverImage];
    [self.view addSubview: self.authorLabel];
    [self.view addSubview: self.continueButton];
    [self.view addSubview: self.introTextView];
}

- (void)setupLayout
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
}

- (void)updateViewConstraints
{
    [super updateViewConstraints];
    // 封面
    [self.coverImage autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:10];
    [self.coverImage autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
    [self.coverImage autoSetDimension:ALDimensionHeight toSize:220];
    [self.coverImage autoSetDimension:ALDimensionWidth toSize:150];
    // 作者
    [self.authorLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.coverImage withOffset:10];
    [self.authorLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.view withOffset:10];
    [self.authorLabel autoSetDimension:ALDimensionWidth toSize: 130];
    // 繼續閱讀
    [self.continueButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.authorLabel withOffset:10];
    [self.continueButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.coverImage withOffset:10];
    // 簡介
    [self.introTextView autoSetDimension:ALDimensionWidth toSize:300];
    [self.introTextView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.coverImage withOffset:10];
    [self.introTextView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    [self.introTextView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view withOffset:10];

}

#pragma mark - action

- (void)continueAction
{
    KFEpubViewController* nextVC = [KFEpubViewController new];
    nextVC.bookID = self.book.bookId;
    [self.navigationController pushViewController:nextVC animated:YES];
}

#pragma mark - getter / setter

- (void)setBook:(BookModel *)book
{
    _book = book;
}

- (UIImageView *)coverImage
{
    if (!_coverImage) {
        _coverImage = [[UIImageView alloc] initForAutoLayout];
        
        _coverImage.image = [UIImage imageNamed: self.book.cover];
    }
    return _coverImage;
}

- (UILabel *)authorLabel
{
    if (!_authorLabel) {
        _authorLabel = [[UILabel alloc] initForAutoLayout];
        _authorLabel.textColor = [UIColor colorWithHexString: kColorFontCyan];
        _authorLabel.font = [UIFont systemFontOfSize: 20];
        _authorLabel.lineBreakMode = NSLineBreakByCharWrapping;
        _authorLabel.numberOfLines = 0;
        _authorLabel.text = self.book.author;
    }
    return _authorLabel;
}

- (UIButton *)continueButton
{
    if (!_continueButton) {
        _continueButton = [[UIButton alloc] initForAutoLayout];
        [_continueButton setTitle:@"繼續閱讀" forState:UIControlStateNormal];
        [_continueButton setTitleColor:[UIColor colorWithHexString:@"F74C4D"] forState:UIControlStateNormal];
        [_continueButton addTarget:self action:@selector(continueAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _continueButton;
}

- (UITextView *)introTextView
{
    if (!_introTextView) {
//        _introTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 100, 300)];
        _introTextView = [[UITextView alloc] initForAutoLayout];
        _introTextView.textColor = [UIColor colorWithHexString: kColorFontCyan];
        _introTextView.font = [UIFont systemFontOfSize:20];
        _introTextView.text = self.book.intro;
        _introTextView.editable = NO;
    }
    return _introTextView;
}

@end
