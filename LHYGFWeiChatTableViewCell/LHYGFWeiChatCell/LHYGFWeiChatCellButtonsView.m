//
//  LHYGFWeiChatCellButtonsView.m
//  LHYGFWeiChatTableViewCell
//
//  Created by Huoyi Lin on 2017/5/11.
//  Copyright © 2017年 Huoyi Lin. All rights reserved.
//

#import "LHYGFWeiChatCellButtonsView.h"

@implementation LHYGFWeiChatCellButtonsView

-(instancetype)init;
{
    if (self = [super init]) {
       
        [self setUpSubViews];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpSubViews];

    }
    return self;
}
-(void)setUpSubViews;
{
    self.backgroundColor = [UIColor yellowColor];
    self.userInteractionEnabled = YES;
    
    self.rightButtonsView = [UIView new];
    self.rightButtonsView.backgroundColor = [UIColor redColor];
    self.rightButtonsView.frame = self.frame;
    [self addSubview:self.rightButtonsView];
    
    self.leftButtonsView = [UIView new];
    self.leftButtonsView.backgroundColor = [UIColor brownColor];
    self.leftButtonsView.frame = self.frame;
    [self addSubview:self.leftButtonsView];
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
