//
//  ViewCreatorHelper.h
//  DJPaymentDemo
//
//  Created by Liu on 2016/11/18.
//  Copyright © 2016年 Dajie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ViewCreatorHelper : NSObject

+ (UIView*)lineWithWidth:(CGFloat)width;

+ (UILabel*)createLabelWithTitle:(NSString*)title
                            font:(UIFont*)font
                           frame:(CGRect)frame
                       textColor:(UIColor*)textColor
                   textAlignment:(NSTextAlignment)textAlignment;
@end
