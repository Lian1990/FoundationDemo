//
//  BaseViewController.h
//  FoundationDemo
//
//  Created by LIAN on 2017/5/10.
//  Copyright © 2017年 com.Alice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"
#import "MBProgressHUD+MP.h"
#import "UIView+EaseBlankPage.h"

@interface BaseViewController : UIViewController<YTKRequestDelegate,UINavigationControllerDelegate>

@property (nonatomic,strong) Reachability *reachiability;

@property (nonatomic,strong) EaseBlankPageView *blankPage;

-(void)startNetworkConnect;//发起请求
-(void)reStartNetworkConnect;//再次请求
-(void)showParserException;//解析错误
-(void)showNoParserData;//没有数据

-(void)buildRightNavBtn;//导航右键
-(void)buildLeftNavBtn;//导航左键

-(void)clickRightNavEvent:(id)sender;
-(void)clickLeftNavEvent:(id)sender;


@end
