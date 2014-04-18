//
//  JoinViewController.m
//  Readmarkable
//
//  Created by hcc on 2014/3/17.
//  Copyright (c) 2014年 hcc. All rights reserved.
//

#import "JoinViewController.h"
#import <SIAlertView.h>

@interface JoinViewController ()
@property (nonatomic, strong) UILabel* hintLabel;
@property (nonatomic, strong) UIImageView* lineImageView;
@property (nonatomic, strong) UITextField* emailField;
@property (nonatomic, strong) UIButton* JoinButton;
@property (nonatomic, strong) UITapGestureRecognizer* tapGesture;
@end

@implementation JoinViewController

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
    [self setLayout];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setLayout
{
//    self.title = @"Readmarkable";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
//    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor colorWithHexString:kColorMainCyan];
    [self.view addSubview: self.hintLabel];
    [self.view addSubview: self.lineImageView];
    [self.view addSubview: self.emailField];
    [self.view addSubview: self.JoinButton];
    [self.view addGestureRecognizer: self.tapGesture];
}

- (void)clickJoinButton
{
    SIAlertView* alertView = [[SIAlertView alloc] initWithTitle: @"READMARKABLE" andMessage:@"超讚！快去檢查你的email吧。"];

    [alertView addButtonWithTitle:@"OK" type:SIAlertViewButtonTypeDestructive handler:^(SIAlertView *alertView) {

    }];
    [alertView show];
}

- (void)textFieldReturn
{
}

- (void)dismissKeyboard:(UITapGestureRecognizer*)sender
{
    [self.view endEditing:YES];
}

#pragma mark - getter

- (UITapGestureRecognizer *)tapGesture
{
    if (!_tapGesture) {
        _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard:)];
    }
    return _tapGesture;
}

- (UILabel *)hintLabel
{
    if (!_hintLabel) {
        _hintLabel = [[UILabel alloc] initWithFrame: CGRectMake( 10, 175, 300, 50)];
        _hintLabel.text = @"請輸入 email 加入我們 READMARKABLE !";
        _hintLabel.font = [UIFont systemFontOfSize: 18];
        _hintLabel.textAlignment = NSTextAlignmentCenter;
        _hintLabel.lineBreakMode = NSLineBreakByCharWrapping;
        _hintLabel.numberOfLines = 0;
        _hintLabel.textColor = [UIColor whiteColor];
    }
    return _hintLabel;
}

- (UIImageView *)lineImageView
{
    if (!_lineImageView) {
        _lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 230, 260, 1)];
        _lineImageView.backgroundColor = [UIColor whiteColor];
    }
    return _lineImageView;
}

- (UITextField *)emailField
{
    if (!_emailField) {
        _emailField = [[UITextField alloc] initWithFrame:CGRectMake(35, 240, 250, 30)];
        _emailField.placeholder = @" email";
        _emailField.backgroundColor = [UIColor whiteColor];
        _emailField.layer.masksToBounds = YES;
        _emailField.layer.cornerRadius = 5;
        _emailField.layer.borderColor = [UIColor whiteColor].CGColor;
        _emailField.layer.borderWidth = 1;
        _emailField.keyboardType = UIKeyboardTypeEmailAddress;
        _emailField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _emailField.autocorrectionType = UITextAutocorrectionTypeNo;
        [_emailField addTarget:self action:@selector(textFieldReturn) forControlEvents:UIControlEventEditingDidEndOnExit];
    }
    return _emailField;
}

- (UIButton *)JoinButton
{
    if (!_JoinButton) {
        _JoinButton = [[UIButton alloc] initWithFrame: CGRectMake( 60, 278, 200, 30)];
        _JoinButton.layer.masksToBounds = YES;
        _JoinButton.layer.cornerRadius = 5;
        _JoinButton.layer.borderColor = [UIColor whiteColor].CGColor;
        _JoinButton.layer.borderWidth = 1;
        [_JoinButton setTitle:@"Join" forState:UIControlStateNormal];
        [_JoinButton addTarget:self action:@selector(clickJoinButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _JoinButton;
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
