//
//  JDMessageCell.m
//  JDQqWithSocket
//
//  Created by JADON on 16/8/18.
//  Copyright © 2016年 JADON. All rights reserved.
//

#import "JDMessageCell.h"
#import "JDMessageCellFrame.h"
#import "JDMessage.h"
#import "UIImage+Extension.h"
@interface JDMessageCell()
@property (nonatomic, weak) UILabel *timeView;
@property (nonatomic, weak) UIImageView *iconView;
@property (nonatomic, weak) UIButton *textView;
@end

@implementation JDMessageCell

+ (instancetype)messageCellWithTableView:(UITableView *)tableView {
    static NSString *reuseId=@"message";
    JDMessageCell *cell=[tableView dequeueReusableCellWithIdentifier:reuseId];
    if (cell==nil) {
        cell=[[JDMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor=[UIColor clearColor];
        UILabel *timeView=[[UILabel alloc] init];
        [self.contentView addSubview:timeView];
        self.timeView=timeView;
        timeView.textAlignment=NSTextAlignmentCenter;
        timeView.font = [UIFont systemFontOfSize:13];
        timeView.textColor = [UIColor grayColor];
        
        
        UIImageView *iconView=[[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView=iconView;
        iconView.layer.cornerRadius=25;
        iconView.layer.masksToBounds=YES;
        
        UIButton *textView=[[UIButton alloc] init];
        [self.contentView addSubview:textView];
        self.textView=textView;
        [textView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        textView.titleLabel.font=[UIFont systemFontOfSize:JDFONTSIZE];
        textView.titleLabel.numberOfLines=0;
        textView.contentEdgeInsets=UIEdgeInsetsMake(20, 20, 20, 20);
    }
    return self;
}

- (void)setMessageFrame:(JDMessageCellFrame *)messageFrame{
    _messageFrame=messageFrame;
    [self setCellContent];
    [self setCellFrame];
}

- (void)setCellContent{
    JDMessage *message=self.messageFrame.message;
    self.timeView.text=message.time;
    NSString *imgName=message.type==JDMessageTypeSelf?@"me":@"other";
    self.iconView.image=[UIImage imageNamed:imgName];
    [self.textView setTitle:message.text forState:UIControlStateNormal];
    if (message.type==JDMessageTypeSelf) {
        [self.textView setBackgroundImage:[UIImage resizeImage:@"chat_send_nor"] forState:UIControlStateNormal];
        [self.textView setBackgroundImage:[UIImage resizeImage:@"chat_send_press_pic"] forState:UIControlStateHighlighted];
    }else{
        [self.textView setBackgroundImage:[UIImage resizeImage:@"chat_recive_nor"] forState:UIControlStateNormal];
        [self.textView setBackgroundImage:[UIImage resizeImage:@"chat_recive_press_pic"] forState:UIControlStateHighlighted];
    }
}

- (void)setCellFrame{
    self.timeView.frame=self.messageFrame.timeFrame;
    self.iconView.frame=self.messageFrame.iconFrame;
    self.textView.frame=self.messageFrame.textFrame;
}


@end
