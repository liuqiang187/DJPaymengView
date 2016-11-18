//
//  DJPaymentChooseView.h
//  DJPaymentDemo
//
//  Created by Liu on 2016/11/16.
//  Copyright © 2016年 Dajie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DJPaymentConfig.h"

@protocol DJPaymentChooseViewDelegate <NSObject>

-(void)didClickBackButton;

@end

@interface DJPaymentChooseView : UIView

@property (nonatomic, weak) id<DJPaymentChooseViewDelegate> delegate;
@end
