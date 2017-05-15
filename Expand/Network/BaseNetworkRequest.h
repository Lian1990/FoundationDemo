//
//  BaseNetworkRequest.h
//  FoundationDemo
//
//  Created by LIAN on 2017/5/4.
//  Copyright © 2017年 com.Alice. All rights reserved.
//

#import "YTKBaseRequest.h"

@interface BaseNetworkRequest : YTKBaseRequest
{
    NSString *_requestUrl;
    YTKRequestMethod _requestMethod;
    id _requestArgument;
}

//DIY一个封装请求
-(instancetype)initWithRequestUrlstring:(NSString *)urlString
                               argument:(id)requestArgument
                          requestMethod:(YTKRequestMethod)requestMethod;


//增加一个网络请求失败的展示

-(void)requestFailed:(YTKBaseRequest *)request;

@end
