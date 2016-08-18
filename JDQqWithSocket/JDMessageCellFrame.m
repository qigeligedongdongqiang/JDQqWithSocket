//
//  JDMessageCellFrame.m
//  JDQqWithSocket
//
//  Created by JADON on 16/8/18.
//  Copyright © 2016年 JADON. All rights reserved.
//

#import "JDMessageCellFrame.h"
#import "JDMessage.h"
#import "NSString+Extension.h"

@implementation JDMessageCellFrame

+ (NSMutableArray *)messageCellFramesList {
    NSArray *messages = [JDMessage messagesList];
    NSMutableArray *temArray = [NSMutableArray array];
    for (JDMessage *message in messages) {
        JDMessageCellFrame *messageCellFrame = [[JDMessageCellFrame alloc] init];
        messageCellFrame.message = message;
        [temArray addObject:messageCellFrame];
    }
    return temArray;
}

- (void)setMessage:(JDMessage *)message {
    _message = message;
    
    UIScreen *screen = [UIScreen mainScreen];
    
    //设置时间frame
    CGFloat timeX = 0;
    CGFloat timeY = 0;
    CGFloat timeW = screen.bounds.size.width;
    CGFloat timeH = 40;
    if (!message.isHiddenTime) {
        _timeFrame = CGRectMake(timeX, timeY, timeW, timeH);
    }
    
    //设置头像
    CGFloat margin=10;
    CGFloat iconW=50;
    CGFloat iconH=50;
    CGFloat iconY=CGRectGetMaxY(_timeFrame);
    CGFloat iconX;
    if (message.type==JDMessageTypeSelf) {
        iconX=screen.bounds.size.width-margin-iconW;
    }else{
        iconX=margin;
    }
    _iconFrame=CGRectMake(iconX, iconY, iconW, iconH);
    
    //设置文字
    CGSize textSize=[message.text sizeWithMaxSize:CGSizeMake(200, MAXFLOAT) fontSize:JDFONTSIZE];
    CGSize btnSize=CGSizeMake(textSize.width+40, textSize.height+40);
    CGFloat textY=iconY;
    CGFloat textX;
    if (message.type==JDMessageTypeSelf) {
        textX=iconX-margin-btnSize.width;
    }else{
        textX=CGRectGetMaxX(_iconFrame)+margin;
    }
    _textFrame=CGRectMake(textX, textY, btnSize.width, btnSize.height);
    
    //计算行高
    CGFloat iconMaxY=CGRectGetMaxY(_iconFrame);
    CGFloat textMaxY=CGRectGetMaxY(_textFrame);
    _rowHeight=MAX(iconMaxY, textMaxY)+margin;

}

@end
