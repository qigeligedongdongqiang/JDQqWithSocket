//
//  JDMessageCellFrame.h
//  JDQqWithSocket
//
//  Created by JADON on 16/8/18.
//  Copyright © 2016年 JADON. All rights reserved.
//
#define JDFONTSIZE 15

#import <UIKit/UIKit.h>

@class JDMessage;

@interface JDMessageCellFrame : NSObject
@property (nonatomic, assign, readonly) CGRect textFrame;
@property (nonatomic, assign, readonly) CGRect timeFrame;
@property (nonatomic, assign, readonly) CGRect iconFrame;

@property (nonatomic, assign, readonly) CGFloat rowHeight;

@property (nonatomic, strong) JDMessage *message;

+ (NSMutableArray *)messageCellFramesList;
@end
