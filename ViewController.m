//
//  ViewController.m
//  FoundationDemo
//
//  Created by LIAN on 2017/5/3.
//  Copyright © 2017年 com.Alice. All rights reserved.
//

#import "ViewController.h"
#import "JSONModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSDictionary *argument1 = @{@"name":@"liannannan105",@"password":@"e10adc3949ba59abbe56e057f20f883e"};
//    BaseNetworkRequest *brequest = [[BaseNetworkRequest alloc]initWithRequestUrlstring:@"login.action?" argument:argument1 requestMethod:YTKRequestMethodGet];
    BaseNetworkRequest *brequest = [[BaseNetworkRequest alloc]init];
//    [brequest baseUrl];
    [brequest startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        NSLog(@"request zhengque right %@",request.responseString);
        JSONModel *md = [[JSONModel alloc]initWithString:request.responseString error:nil];
        NSLog(@"request zhengque right %@ %@",request.responseString,md);

    } failure:^(__kindof YTKBaseRequest *request) {
        [brequest requestFailed:request];
        NSLog(@"error error");
    }];
//    [self startNetWork];
}
-(void)startNetWork{
    NSDictionary *argument = @{@"name":@"liannannan105",@"password":@"e10adc3949ba59abbe56e057f20f883e"};
    BaseNetworkRequest *brequest = [[BaseNetworkRequest alloc]initWithRequestUrlstring:@"login.action?" argument:argument requestMethod:YTKRequestMethodGet];
    brequest.delegate = self;
    [brequest start];
}
-(void)requestFinished:(YTKBaseRequest *)request{
    NSLog(@"request zhengque right %@",request.responseString);

}
- (void)requestFailed:(YTKBaseRequest *)request{
    NSLog(@"fail type is %ld",request.requestOperation.response.statusCode);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
