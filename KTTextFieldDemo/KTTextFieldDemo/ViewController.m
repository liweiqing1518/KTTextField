//
//  ViewController.m
//  KTTextFieldDemo
//
//  Created by Vincent on 2017/6/8.
//  Copyright © 2017年 李维庆. All rights reserved.
//

#import "ViewController.h"
#import "KTBottomLine.h"
#import "KTTextField.h"

@interface ViewController ()

//账号输入框
@property (strong, nonatomic) KTTextField *accountTextField;
//密码输入框
@property (strong, nonatomic) KTTextField *passwordTextField;
//登录按钮
@property (strong, nonatomic) UIButton *loginButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.accountTextField];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.loginButton];
    // Do any additional setup after loading the view, typically from a nib.
}

- (KTTextField *)accountTextField{
    if (!_accountTextField) {
        _accountTextField = [[KTTextField alloc] initWithFrame:CGRectMake(65, 200, self.view.frame.size.width - 100, 40)];
        _accountTextField.backgroundColor = [UIColor clearColor];
        _accountTextField.placeHolderStr = @"输入账户";
        _accountTextField.leftImage = [UIImage imageNamed:@"login_moblie.png"];
    }
    return _accountTextField;
}

- (KTTextField *)passwordTextField{
    if (!_passwordTextField) {
        _passwordTextField = [[KTTextField alloc] initWithFrame:CGRectMake(65, 300, self.view.frame.size.width - 100, 40)];
        _passwordTextField.backgroundColor = [UIColor clearColor];
        _passwordTextField.placeHolderStr = @"输入密码";
        _passwordTextField.leftImage = [UIImage imageNamed:@"login_passcode.png"];
    }
    return _passwordTextField;
}

- (UIButton *)loginButton{
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _loginButton.frame = CGRectMake((self.view.frame.size.width - 300)/2, 400, 300, 44);
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _loginButton.titleLabel.font = [UIFont systemFontOfSize:20.0];
        [_loginButton setBackgroundImage:[UIImage imageNamed:@"login_button.png"] forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(loginButtonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

- (void)loginButtonClickedAction:(UIButton *)button{
    NSString *accountString = self.accountTextField.inputTextField.text;
    NSString *passwordString = self.passwordTextField.inputTextField.text;
    NSLog(@"\n登录信息:\n 账户:%@ \n 密码:%@",accountString,passwordString);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.accountTextField.inputTextField resignFirstResponder];
    [self.passwordTextField.inputTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
