//
//  DJPaymentDetailView.h
//  DJPaymentDemo
//
//  Created by Liu on 2016/11/16.
//  Copyright © 2016年 Dajie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DJPaymentConfig.h"

@protocol DJPaymentDetailViewDelegate <NSObject>

-(void)didClickChooseWaysLabel;
-(void)didClickCloseButton;

@end

@interface DJPaymentDetailView : UIView

/** 订单详情 */
@property (nonatomic, strong) UILabel * detailLabel;
/** 付款方式 */
@property (nonatomic, strong) UILabel * chooseWaysLabel;
/** tip1 */
@property (nonatomic, strong) UILabel * tipLabel;
/** tip2 */
@property (nonatomic, strong) UILabel * orangeTip;
/** 需付款 */
@property (nonatomic, strong) UILabel * payLabel;

/** style */
@property (nonatomic, assign) DJPaymentDetailInfoStyle infoStyle;

/** delegate */
@property (nonatomic, weak) id<DJPaymentDetailViewDelegate> delegate;


@end
