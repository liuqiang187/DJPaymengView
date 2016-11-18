//
//  DJPaymentLoadingView.h
//  djBusiness
//
//  Created by Liu on 2016/11/18.
//  Copyright © 2016年 dajie.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    DJPaymentLoadStatusLoading,
    DJPaymentLoadStatusSuccess,
    DJPaymentLoadStatusFailed
} DJPaymentLoadStatus;

@interface DJPaymentLoadingView : UIView

/**
 *  加载状态
 *
 *  @param status 状态
 */
- (void)loadStatus:(DJPaymentLoadStatus)status;

/**
 *  清楚图层
 */
- (void)cleanLayer;

@end
