//
//  introductoryPagesHelper.h
//  MobileProject
//
//  Created by  AAA on 16/7/14.
//  Copyright © 2016年  AAA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "introductoryPagesView.h"

@interface introductoryPagesHelper : NSObject

+ (instancetype)shareInstance;

+(void)showIntroductoryPageView:(NSArray *)imageArray;

@end
