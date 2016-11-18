//
//  DJPaymentChooseSingleView.h
//  djBusiness
//
//  Created by Liu on 2016/11/17.
//  Copyright © 2016年 dajie.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DJPaymentChooseSingleView : UIView

/** img */
@property (nonatomic, strong) UIImageView * iconImg;
/** typeStr */
@property (nonatomic, strong) UILabel * titleLabel;
/** subStr */
@property (nonatomic, strong) UILabel * subTitleLabel;
/** sele */
@property (nonatomic, strong) UIImageView * selectImg;
/** bool */
@property (nonatomic, assign) BOOL isSelect;
@property (nonatomic, strong) UIView * line;
@end
