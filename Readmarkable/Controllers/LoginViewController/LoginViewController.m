//
//  LoginViewController.m
//  Readmarkable
//
//  Created by hcc on 2014/3/16.
//  Copyright (c) 2014年 hcc. All rights reserved.
//

#import "LoginViewController.h"
#import "BookStoreViewController.h"
@interface LoginViewController ()
@property (nonatomic, strong) UILabel* hintLabel;
@property (nonatomic, strong) UIImageView* lineImageView;
@property (nonatomic, strong) UITextField* emailField;
@property (nonatomic, strong) UITextField* passwordField;
@property (nonatomic, strong) UIButton* loginButton;
@property (nonatomic, strong) UIButton* clearButton;
@end

@implementation LoginViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setLayout
{
    self.view.backgroundColor = [UIColor colorWithHexString: kColorMainCyan];
    self.title = @"Readmarkable";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
//    self.navigationController.navigationItem.leftBarButtonItem = [UIImage imageNamed:@"Xion"];
//    self.navigationController.navigationBar.
//    [self.navigationController.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Xion"] style:UIBarButtonItemStyleDone target:nil action:nil]];
    
    [self.view addSubview: self.hintLabel];
    [self.view addSubview: self.lineImageView];
    [self.view addSubview: self.emailField];
    [self.view addSubview: self.passwordField];
    [self.view addSubview: self.loginButton];
    [self.view addSubview: self.clearButton];
}

- (void) clickClearButton
{
//    NSLog(@"123");
    self.emailField.text = nil;
    self.passwordField.text = nil;
}

- (void) clickLoginButton
{
    BookStoreViewController* BookStoreView = [BookStoreViewController new];
    [self.navigationController pushViewController: BookStoreView animated:YES];
}

- (void) textFieldReturn
{
}

#pragma mark - getter

- (UILabel *)hintLabel
{
    if (!_hintLabel) {
        _hintLabel = [[UILabel alloc] initWithFrame: CGRectMake( 10, 165, 300, 50)];
        _hintLabel.text = @"請輸入 email 和 password 登入 Readmarkable !";
        _hintLabel.textAlignment = NSTextAlignmentCenter;
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
        _lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 220, 260, 1)];
        _lineImageView.backgroundColor = [UIColor whiteColor];
    }
    return _lineImageView;
}

- (UITextField *)emailField
{
    if (!_emailField) {
        _emailField = [[UITextField alloc] initWithFrame:CGRectMake(35, 230, 250, 30)];
        _emailField.placeholder = @" email";
        _emailField.backgroundColor = [UIColor whiteColor];
        _emailField.layer.masksToBounds = YES;
        _emailField.layer.cornerRadius = 5;
        _emailField.layer.borderColor = [UIColor whiteColor].CGColor;
        _emailField.layer.borderWidth = 1;
        [_emailField addTarget:self action:@selector(textFieldReturn) forControlEvents:UIControlEventEditingDidEndOnExit];
    }
    return _emailField;
}

- (UITextField *)passwordField
{
    if (!_passwordField) {
        _passwordField = [[UITextField alloc] initWithFrame:CGRectMake(35, 270, 250, 30)];
        _passwordField.placeholder = @" password";
        _passwordField.backgroundColor = [UIColor whiteColor];
        _passwordField.secureTextEntry = YES;
        _passwordField.layer.masksToBounds = YES;
        _passwordField.layer.cornerRadius = 5;
        _passwordField.layer.borderColor = [UIColor whiteColor].CGColor;
        _passwordField.layer.borderWidth = 1;
        [_passwordField addTarget:self action:@selector(textFieldReturn) forControlEvents:UIControlEventEditingDidEndOnExit];
    }
    return _passwordField;
}

- (UIButton *)loginButton
{
    if (!_loginButton) {
        _loginButton = [[UIButton alloc] initWithFrame: CGRectMake(35, 310, 120, 30)];
        _loginButton.layer.masksToBounds = YES;
        _loginButton.layer.cornerRadius = 5;
        _loginButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _loginButton.layer.borderWidth = 1;
        [_loginButton setTitle:@"Login" forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(clickLoginButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

- (UIButton *)clearButton
{
    if (!_clearButton) {
        _clearButton = [[UIButton alloc] initWithFrame: CGRectMake(165, 310, 120, 30)];
        _clearButton.layer.masksToBounds = YES;
        _clearButton.layer.cornerRadius = 5;
        _clearButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _clearButton.layer.borderWidth = 1;
        [_clearButton addTarget:self action:@selector(clickClearButton) forControlEvents:UIControlEventTouchUpInside];
        [_clearButton setTitle:@"Clear" forState:UIControlStateNormal];
    }
    return _clearButton;
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    NSLog(@"123");
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}


@end
