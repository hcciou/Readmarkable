//
//  ViewController.m
//  Readmarkable
//
//  Created by hcc on 2014/3/15.
//  Copyright (c) 2014年 hcc. All rights reserved.
//

#import "MainController.h"
#import "LoginViewController.h"
#import "JoinViewController.h"

@interface MainController ()
@property (nonatomic, strong) UIImageView* logoImageView;
@property (nonatomic, strong) UIButton* loginButton;
@property (nonatomic, strong) UIButton* joinButton;
@end

@implementation MainController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setLayout];
}

- (void) setLayout
{
    self.title = @"";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString: kColorMainCyan];

    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    
    self.view.backgroundColor = [UIColor colorWithHexString: kColorMainCyan];
    [self.view addSubview: self.loginButton];
    [self.view addSubview: self.joinButton];
    [self.view addSubview: self.logoImageView];
}

#pragma mark - getter
- (UIImageView *)logoImageView
{
    if (!_logoImageView) {
        _logoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logoImage"]];
        _logoImageView.frame = CGRectMake(10, 50, 300, 300);
    }
    return _logoImageView;
}

- (UIButton *)loginButton
{
    if (!_loginButton) {
        _loginButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 350, 150, 30)];
        _loginButton.backgroundColor = [UIColor colorWithHexString: kColorMainCyan];
        _loginButton.layer.masksToBounds = YES;
        _loginButton.layer.cornerRadius = 10;
        _loginButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _loginButton.layer.borderWidth = 2;
        [_loginButton setTitle:@"Login" forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(clickLoginButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

- (UIButton *)joinButton
{
    if (!_joinButton) {
        _joinButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 400, 150, 30)];
        _joinButton.backgroundColor = [UIColor redColor];
        _joinButton.backgroundColor = [UIColor colorWithHexString: kColorMainCyan];
        _joinButton.layer.masksToBounds = YES;
        _joinButton.layer.cornerRadius = 10;
        _joinButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _joinButton.layer.borderWidth = 2;
        [_joinButton setTitle:@"Join" forState:UIControlStateNormal];
        [_joinButton addTarget:self action:@selector(clickJoinButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _joinButton;
}

//- (LoginView *)loginView
//{
//    if (!_loginView) {
//        _loginView = [[LoginView alloc] initWithFrame:CGRectMake(10, 150, 300, 200)];
//    }
//    return _loginView;
//}

#pragma mark - Action
- (void) clickLoginButton
{
    LoginViewController* loginView = [LoginViewController new];
    [self.navigationController pushViewController: loginView animated:YES];
}

- (void) clickJoinButton
{
    JoinViewController* joinView = [JoinViewController new];
    [self.navigationController pushViewController: joinView animated:YES];
}


@end
