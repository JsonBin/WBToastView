//
//  NSString+WBExtension.m
//  WBToastView
//
//  Created by Zwb on 16/4/9.
//  Copyright © 2016年 zwb. All rights reserved.
//

#import "NSString+WBExtension.h"

@implementation NSString (WBExtension)
-(CGSize)sizeWithSize:(CGSize)size AndFont:(UIFont *)font{
    if (!font) {
        font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    }
    NSDictionary *dict = @{NSFontAttributeName:font};
    CGRect rect = [self boundingRectWithSize:size
                                     options:
                   NSStringDrawingUsesFontLeading |
                   NSStringDrawingUsesLineFragmentOrigin |
                   NSStringDrawingTruncatesLastVisibleLine
                                  attributes:dict
                                     context:nil];
    
    return rect.size;
}

@end
