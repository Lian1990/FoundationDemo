//
//  BaseModel.h
//  FoundationDemo
//
//  Created by LIAN on 2017/5/11.
//  Copyright © 2017年 com.Alice. All rights reserved.
//

#import "JSONModel.h"

@interface BaseModel : JSONModel

@property (nonatomic,copy)NSString<Optional> *code;
@property (nonatomic,copy)NSString<Optional> *message;
@property (nonatomic,copy)NSDictionary<Optional>*results;


@end
