//
//  DJPaymentConfirmButton.h
//  DJPaymentDemo
//
//  Created by Liu on 2016/11/16.
//  Copyright © 2016年 Dajie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DJPaymentConfig.h"

@interface DJPaymentConfirmButton : UIButton

/** state */
@property (nonatomic, assign) DJPaymentConfirmButtonState payState;

@end
