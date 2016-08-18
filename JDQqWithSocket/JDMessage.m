//
//  JDMessage.m
//  JDQqWithSocket
//
//  Created by JADON on 16/8/18.
//  Copyright © 2016年 JADON. All rights reserved.
//

#import "JDMessage.h"

@implementation JDMessage
- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)messageWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

+ (NSArray *)messagesList{
    NSBundle *bundle= [NSBundle mainBundle];
    NSString *path= [bundle pathForResource:@"messages" ofType:@"plist"];
    NSArray *dicArray= [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *tempArray=[NSMutableArray array];
    JDMessage *preMessage;
    for(NSDictionary *dic in dicArray){
        JDMessage *message=[JDMessage messageWithDic:dic];
        if ([message.time isEqualToString:preMessage.time]) {
            message.hiddenTime=YES;
        }
        [tempArray addObject:message];
        preMessage=message;
    }
    return tempArray;
}

@end
