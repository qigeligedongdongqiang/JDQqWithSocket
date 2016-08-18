//
//  JDMessageCell.h
//  JDQqWithSocket
//
//  Created by JADON on 16/8/18.
//  Copyright © 2016年 JADON. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JDMessageCellFrame;

@interface JDMessageCell : UITableViewCell
@property (nonatomic, strong) JDMessageCellFrame *messageFrame;
+ (instancetype)messageCellWithTableView:(UITableView *)tableView;

@end
