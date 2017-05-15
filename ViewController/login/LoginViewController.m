//
//  LoginViewController.m
//  FoundationDemo
//
//  Created by LIAN on 2017/5/11.
//  Copyright © 2017年 com.Alice. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginModel.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self startNetworkConnect];
    
//    [MBProgressHUD showInfo:@"ceshi" ToView:self.view];
}
-(void)startNetworkConnect{
    [super startNetworkConnect];
//    [MBProgressHUD showProgressToView:self.view Text:@"加载中"];
    NSDictionary *argument = @{@"name":@"liannannan105",@"password":@"e10adc3949ba59abbe56e057f20f883e"};
    BaseNetworkRequest *brequest = [[BaseNetworkRequest alloc]initWithRequestUrlstring:@"login.action?" argument:argument requestMethod:YTKRequestMethodGet];
    brequest.delegate = self;
    [brequest start];
    
    NSLog(@"the subviews is %@",self.view.subviews);
}
-(void)requestFinished:(YTKBaseRequest *)request{
    [MBProgressHUD hideHUDForView:self.view];
    
    LoginModel *login = [[LoginModel alloc]initWithString:request.responseString error:nil];
    NSLog(@"login info is %@",login);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
