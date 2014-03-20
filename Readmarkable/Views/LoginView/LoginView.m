//
//  LoginView.m
//  Readmarkable
//
//  Created by hcc on 2014/3/15.
//  Copyright (c) 2014年 hcc. All rights reserved.
//

#import "LoginView.h"

@interface LoginView()
@property (nonatomic, strong) UILabel* hintLabel;
@property (nonatomic, strong) UIImageView* lineImageView;
@property (nonatomic, strong) UITextField* emailField;
@property (nonatomic, strong) UITextField* passwordField;
@property (nonatomic, strong) UIButton* loginButton;
@property (nonatomic, strong) UIButton* cancelButton;
@end


@implementation LoginView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setLayout];
    }
    return self;
}

- (void) setLayout
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 10;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = 2;
    self.backgroundColor = [UIColor colorWithHexString: kColorMainCyan];
    [self addSubview: self.hintLabel];
    [self addSubview: self.lineImageView];
    [self addSubview: self.emailField];
    [self addSubview: self.passwordField];
    [self addSubview: self.loginButton];
    [self addSubview: self.cancelButton];
}

- (void) clickCancalButton
{
    NSLog(@"click!");
}

#pragma mark - getter

- (UILabel *)hintLabel
{
    if (!_hintLabel) {
        _hintLabel = [[UILabel alloc] initWithFrame: CGRectMake(25, 15, 300, 50)];
        _hintLabel.text = @"請輸入 email 和 password 登入 Readmarkable !";
        _hintLabel.font = [UIFont systemFontOfSize: 18];
        _hintLabel.lineBreakMode = NSLineBreakByCharWrapping;
        _hintLabel.numberOfLines = 0;
        _hintLabel.textColor = [UIColor whiteColor];
    }
    return _hintLabel;
}

- (UIImageView *)lineImageView
{
    if (!_lineImageView) {
        _lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 70, 260, 1)];
        _lineImageView.backgroundColor = [UIColor whiteColor];
    }
    return _lineImageView;
}

- (UITextField *)emailField
{
    if (!_emailField) {
        _emailField = [[UITextField alloc] initWithFrame:CGRectMake(25, 80, 250, 30)];
        _emailField.placeholder = @" email";
        _emailField.backgroundColor = [UIColor whiteColor];
        _emailField.layer.masksToBounds = YES;
        _emailField.layer.cornerRadius = 5;
        _emailField.layer.borderColor = [UIColor whiteColor].CGColor;
        _emailField.layer.borderWidth = 1;
    }
    return _emailField;
}

- (UITextField *)passwordField
{
    if (!_passwordField) {
        _passwordField = [[UITextField alloc] initWithFrame:CGRectMake(25, 120, 250, 30)];
        _passwordField.placeholder = @" password";
        _passwordField.backgroundColor = [UIColor whiteColor];
        _passwordField.secureTextEntry = YES;
        _passwordField.layer.masksToBounds = YES;
        _passwordField.layer.cornerRadius = 5;
        _passwordField.layer.borderColor = [UIColor whiteColor].CGColor;
        _passwordField.layer.borderWidth = 1;
    }
    return _passwordField;
}

- (UIButton *)loginButton
{
    if (!_loginButton) {
        _loginButton = [[UIButton alloc] initWithFrame: CGRectMake(25, 160, 120, 30)];
        _loginButton.layer.masksToBounds = YES;
        _loginButton.layer.cornerRadius = 5;
        _loginButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _loginButton.layer.borderWidth = 1;
        [_loginButton setTitle:@"Login" forState:UIControlStateNormal];
    }
    return _loginButton;
}

- (UIButton *)cancelButton
{
    if (!_cancelButton) {
        _cancelButton = [[UIButton alloc] initWithFrame: CGRectMake(155, 160, 120, 30)];
        _cancelButton.layer.masksToBounds = YES;
        _cancelButton.layer.cornerRadius = 5;
        _cancelButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _cancelButton.layer.borderWidth = 1;
        [_cancelButton addTarget:self action:@selector(clickCancalButton) forControlEvents:UIControlEventTouchUpInside];
        [_cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    }
    return _cancelButton;

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
