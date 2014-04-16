//
//  DetailViewController.m
//  Readmarkable
//
//  Created by hcc on 2014/4/12.
//  Copyright (c) 2014年 hcc. All rights reserved.
//

#import "DetailViewController.h"
#import "ContentViewController.h"
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
    // 作者
    [self.authorLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.coverImage withOffset:10];
    [self.authorLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.view withOffset:10];
    // 繼續閱讀
    [self.continueButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.authorLabel withOffset:10];
    [self.continueButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.coverImage withOffset:10];
    // 簡介
    [self.introTextView autoSetDimension:ALDimensionWidth toSize:300];
    [self.introTextView autoSetDimension:ALDimensionHeight toSize:1000];
    [self.introTextView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.coverImage withOffset:10];
    [self.introTextView autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.view withOffset:10];

}

#pragma mark - action

- (void)continueAction
{
    ContentViewController* nextVC = [ContentViewController new];
//    RootViewController* nextVC = [RootViewController new];
    [self.navigationController pushViewController:nextVC animated:YES];
}

#pragma mark - getter

- (UIImageView *)coverImage
{
    if (!_coverImage) {
        _coverImage = [[UIImageView alloc] initForAutoLayout];
        _coverImage.image = [UIImage imageNamed:@"kinfolk"];
    }
    return _coverImage;
}

- (UILabel *)authorLabel
{
    if (!_authorLabel) {
        _authorLabel = [[UILabel alloc] initForAutoLayout];
        _authorLabel.textColor = [UIColor colorWithHexString: kColorFontCyan];
        _authorLabel.font = [UIFont systemFontOfSize: 20];
        _authorLabel.text = @"奈森‧威廉斯";
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
        _introTextView.text = @"最簡單自然的生活，與家人朋友在餐桌上共享的愜意時光來自遠方的美好，其實就在不遠處Kinfolk是南美的一句古語，意思是家人。美國獨立飲食生活雜誌《KINFOLK》，從創刊之初一直以低調精緻的內容編排，和純淨獨特的生活美學深受讀者喜愛。它反映出人們對於單純的渴望，不時與親友藉著在餐桌上相聚的時光，分享彼此對生活的熱情。由雜誌原班團隊製作的《KINFOLK餐桌》，是他們的第一本食譜書。與其說它是食譜，不如說是人們選擇的一種生活方式。書中，《KINFOLK》團隊走訪各地，採訪美食作家、雜誌編輯、花藝家、設計師、咖啡鑑賞家、廚師、麵包師傅等各行各業的工藝職人，走入他們家中，捕捉他們與眾不同的個人特質，描繪他們所重視的傳統和日常儀式，還有他們與心愛家人朋友共享的餐桌時光。這些懂得生活而且「喜歡生活」的人們，慷慨地和讀者分享他們簡單美味的私房料理──現烤的火雞酪梨漢堡、奶奶特製的酥皮水果捲、早晨的野生莓果手工果醬配燕麥粥，或是丹麥人最喜愛的開放式三明治──這些食譜的目的不是為了學習華麗的高級料理，而是為了在每次聚會時，能夠享受一起動手製作料理的樂趣與滿足感。不知道為什麼，和大家一起分享的食物總是特別好吃，愉快的時光就在此起彼落的對話談笑聲中悄悄流逝。《KINFOLK餐桌》就像是你我的食物櫃，打開便可以發現滿滿對料理和生活的美好想法，要我們別忘了從每天的日常生活中發現並創造美的事物，即使那僅僅意味著一杯茶和一湯匙的自製果醬，我們還是可以和好友圍坐餐桌旁，一起分享那簡單的美好。";
        _introTextView.editable = NO;
    }
    return _introTextView;
}

@end
