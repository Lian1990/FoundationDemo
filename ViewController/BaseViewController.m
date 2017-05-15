//
//  BaseViewController.m
//  FoundationDemo
//
//  Created by LIAN on 2017/5/10.
//  Copyright © 2017年 com.Alice. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

@synthesize reachiability = _reachiability;

-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
   
    
   
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    _reachiability = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    [_reachiability startNotifier];
}
// 网络判断
- (void)reachabilityChanged: (NSNotification* )notification
{
    Reachability *curReach = [notification object];
    NSParameterAssert([curReach isKindOfClass: [Reachability class]]);
    
    NSLog(@"status is -----%@",notification.userInfo);
    switch (curReach.currentReachabilityStatus) {
        case NotReachable:{
            [MBProgressHUD showInfo:@"当前网络连接失败，请查看设置" ToView:self.view];
        }
            break;
        case ReachableViaWiFi:
            NSLog(@"wifi上网2");
            break;
        case ReachableViaWWAN:
            NSLog(@"手机上网2");
            break;
        default:
            break;
    }
}
-(void)buildBlankPage{
    self.blankPage = [[EaseBlankPageView alloc]initWithFrame:CGRectMake(0, 64, Main_Screen_Width, Main_Screen_Height-108)];
    [self.view addSubview:self.blankPage];
}
-(void)startNetworkConnect{
    [MBProgressHUD showProgressToView:self.view Text:@"加载中"];
}
-(void)reStartNetworkConnect{
    [self startNetworkConnect];
}
-(void)requestFinished:(YTKBaseRequest *)request{
    NSLog(@"request zhengque right %@",request.responseString);
    [MBProgressHUD hideHUDForView:self.view];
    
}
- (void)requestFailed:(YTKBaseRequest *)request{
    NSLog(@"fail type is %ld",request.requestOperation.response.statusCode);
    [MBProgressHUD hideHUDForView:self.view];
    NSString *errorStr = [NSString stringWithFormat:@"%ld",request.requestOperation.response.statusCode];
    [MBProgressHUD showError:errorStr ToView:self.view];
    [self buildBlankPage];
    [self.blankPage configWithType:EaseBlankPageTypeView hasData:NO hasError:YES reloadButtonBlock:^(id sender) {
        [self reStartNetworkConnect];
        [MBProgressHUD hideHUDForView:self.view];
    }];
}
-(void)showNoParserData{
    [MBProgressHUD hideHUDForView:self.view];
    NSLog(@"没有数据");
}
-(void)showParserException{
    [MBProgressHUD hideHUDForView:self.view];
    NSLog(@"数据解析错误");
}
-(void)buildLeftNavBtn{
    
}
-(void)buildRightNavBtn{
    
}
-(void)clickRightNavEvent:(id)sender{
    
}
-(void)clickLeftNavEvent:(id)sender{
    
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
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
