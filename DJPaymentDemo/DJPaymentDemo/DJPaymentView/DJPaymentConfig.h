//
//  DJPayementConfig.h
//  DJPaymentDemo
//
//  Created by Liu on 2016/11/16.
//  Copyright © 2016年 Dajie. All rights reserved.
//

#ifndef DJPayementConfig_h
#define DJPayementConfig_h

#import "UIViewAdditions.h"
#import "ColorUtility.h"
#import "ViewCreatorHelper.h"

typedef enum : NSUInteger {
    DJPaymentMethodPrivilegeBook =  0,  // 特权劵
    DJPaymentMethodPrivilegePoint = 1,  // 特权点
} DJPaymentMethod;

typedef enum : NSUInteger {
    DJPaymentDetailInfoStyleDefault =  0,  // 普通样式
    DJPaymentDetailInfoStyleNoMoney = 1,  // 余额不足
} DJPaymentDetailInfoStyle;

typedef enum : NSUInteger {
    DJPaymentConfirmButtonStateCertainPay = 0,  // 确认支付
    DJPaymentConfirmButtonStatePayLoading = 1,  // 正在支付...
    DJPaymentConfirmButtonStatePaySuccess = 2,  // 支付成功
    DJPaymentConfirmButtonStatePayNomoney = 3,  // 余额不足，无法支付
} DJPaymentConfirmButtonState;

#define kColor00b4c9       [ColorUtility colorWithHexString:@"#00b4c9"]

#define kPad 15
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
// 屏幕bounds
#define kScreenBounds ([[UIScreen mainScreen] bounds])

// 屏幕尺寸
#define kScreenSize ([[UIScreen mainScreen] bounds].size)

#endif /* DJPayementConfig_h */
