//
//  UIImage+Extension.m
//  JDQqWithSocket
//
//  Created by JADON on 16/8/18.
//  Copyright © 2016年 JADON. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
+ (instancetype)resizeImage:(NSString *)imgName{
    UIImage *img=[UIImage imageNamed:imgName];
    return [img stretchableImageWithLeftCapWidth:img.size.width/2 topCapHeight:img.size.height/2];
}
@end
