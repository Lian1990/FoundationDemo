//
//  BaseNetworkRequest.m
//  FoundationDemo
//
//  Created by LIAN on 2017/5/4.
//  Copyright © 2017年 com.Alice. All rights reserved.
//

#import "BaseNetworkRequest.h"

@implementation BaseNetworkRequest

- (NSString *)requestUrl {
//    return @"";
    return _requestUrl ?: @"";
}

- (NSString *)cdnUrl {
    return @"";
}

- (NSString *)baseUrl {
    return @"http://124.251.54.189/datacenter-api/attendance/";//lnn
//    return @"https://www.baidu.com";
}

//DIY的方法
-(instancetype)initWithRequestUrlstring:(NSString *)urlString argument:(id)requestArgument requestMethod:(YTKRequestMethod)requestMethod{
    self = [super init];
    if (self) {
        _requestUrl = urlString;
        _requestArgument = requestArgument;
        _requestMethod = requestMethod;
    }
    return self;
}
-(id)requestArgument{
    return _requestArgument ?_requestArgument:@"";
}
//失败处理
-(void)requestFailed:(YTKBaseRequest *)request{
    if (request.responseStatusCode == 404) {
        //
        NSLog(@"404 访问不到数据");
    }else{
        NSLog(@"系统繁忙，访问不到数据");
    }
}
/**
 公共部分

 @return return value description
 */
-(NSDictionary *)requestHeaderFieldValueDictionary{
    NSString *versionlStr = [NSString stringWithFormat:@"%@",[[NSBundle mainBundle]objectForInfoDictionaryKey:@"CFBundleShortVersionString"]];
    NSDictionary *headerDictionary=@{@"platform":@"ios",
                                     @"version":versionlStr};
    return headerDictionary;
}

@end
