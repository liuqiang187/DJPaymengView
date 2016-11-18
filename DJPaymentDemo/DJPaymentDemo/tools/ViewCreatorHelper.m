//
//  ViewCreatorHelper.m
//  DJPaymentDemo
//
//  Created by Liu on 2016/11/18.
//  Copyright © 2016年 Dajie. All rights reserved.
//

#import "ViewCreatorHelper.h"
#import "ColorUtility.h"

@implementation ViewCreatorHelper

+ (UIView*)lineWithWidth:(CGFloat)width
{
    CGFloat screenScale = [UIScreen mainScreen].scale;
    CGFloat h = 1.0f;
    if (screenScale > 0.0f) {
        h = 1.0f / screenScale;
    }
    
    CGRect rc = CGRectMake(0.0f, 0.0f, width, h);
    UIView* lineView = [[UIView alloc] initWithFrame:rc];
    lineView.backgroundColor = [ColorUtility colorWithHexString:@"#DCDCDC"];
    return lineView;
}

+ (UILabel*)createLabelWithTitle:(NSString*)title
                            font:(UIFont*)font
                           frame:(CGRect)frame
                       textColor:(UIColor*)textColor
                   textAlignment:(NSTextAlignment)textAlignment
{
    UILabel* label = [[UILabel alloc] initWithFrame:frame];
    label.text = title;
    if (font != nil) {
        label.font = font;
    }
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    label.backgroundColor = [UIColor clearColor];
    
    return label;
}

@end
