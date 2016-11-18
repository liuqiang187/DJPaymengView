//
//  DJPaymentChooseSingleView.m
//  djBusiness
//
//  Created by Liu on 2016/11/17.
//  Copyright © 2016年 dajie.com. All rights reserved.
//

#import "DJPaymentChooseSingleView.h"
#import "DJPaymentConfig.h"

@implementation DJPaymentChooseSingleView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        [self createSubviews];
    }
    return self;
}

-(void)createSubviews
{
    _iconImg = [[UIImageView alloc] init];
    _iconImg.frame = CGRectMake(kPad, 17, 16, 16);
    [self addSubview:_iconImg];
    
    _titleLabel = [ViewCreatorHelper createLabelWithTitle:@""
                                                     font:[UIFont systemFontOfSize:14]
                                                    frame:CGRectMake(_iconImg.right+5, _iconImg.top, 0, 0)
                                                textColor:[ColorUtility colorWithHexString:@"5A5F6D"]
                                            textAlignment:NSTextAlignmentLeft];
    [self addSubview:_titleLabel];
    
    _subTitleLabel = [ViewCreatorHelper createLabelWithTitle:@""
                                                        font:[UIFont systemFontOfSize:12]
                                                       frame:CGRectMake(_iconImg.right+5, _titleLabel.bottom+3, 0, 0)
                                                   textColor:[ColorUtility colorWithHexString:@"bbbbbb"]
                                               textAlignment:NSTextAlignmentLeft];
    [self addSubview:_subTitleLabel];
    
    _selectImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check"]];
    _selectImg.frame = CGRectMake(0, 17, 16, 16);
    [self addSubview:_selectImg];
    
    _line = [ViewCreatorHelper lineWithWidth:self.width -kPad*2];
    [self addSubview:_line];
    _line.hidden = YES;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [_titleLabel sizeToFit];
    if (_titleLabel.width > self.width -70) {
        _titleLabel.width = self.width -70;
    }
    
    _subTitleLabel.top = _titleLabel.bottom+5;
    [_subTitleLabel sizeToFit];
    if (_subTitleLabel.width > self.width -70) {
        _subTitleLabel.width = self.width -70;
    }
    
    _selectImg.right = self.right - kPad;
    _selectImg.centerY = self.height /2;
    
    _line.left = kPad;
    _line.bottom = self.height;
}

@end
