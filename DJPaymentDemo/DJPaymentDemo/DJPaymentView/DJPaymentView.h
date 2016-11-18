//
//  DJPaymentView.h
//  DJPaymentDemo
//
//  Created by Liu on 2016/11/16.
//  Copyright © 2016年 Dajie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DJPaymentConfig.h"
@class DJPaymentView;

@protocol DJPaymentViewDelegate <NSObject>

- (void)paymentComplete;

@end

@interface DJPaymentView : UIView

@property (nonatomic, weak) id<DJPaymentViewDelegate> delegate;

/**
 *  快速创建一个付款视图
 *
 *  @param info          付款详情
 *  @param money         金额
 *  @param paymentMethod 付款方式
 */
- (instancetype)initWithInfo:(NSString *)info money:(NSString *)money paymentMethod:(DJPaymentMethod)paymentMethod;

/**
 *  付款结果
 *
 *  @param result YES为成功
 *  @param message 提示信息
 */
- (void)paymentResult:(BOOL)result message:(NSString *)message;

/**
 *  显示付款视图
 */
- (void)show;

/**
 *  销毁付款视图
 */
- (void)dismiss;

@end
