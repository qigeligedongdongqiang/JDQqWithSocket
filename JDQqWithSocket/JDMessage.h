//
//  JDMessage.h
//  JDQqWithSocket
//
//  Created by JADON on 16/8/18.
//  Copyright © 2016年 JADON. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    JDMessageTypeSelf,
    JDMessageTypeOther
} JDMessageType;

@interface JDMessage : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, assign) JDMessageType type;

@property (nonatomic, assign, getter=isHiddenTime) BOOL hiddenTime;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)messageWithDic:(NSDictionary *)dic;

+ (NSArray *)messagesList;
@end
