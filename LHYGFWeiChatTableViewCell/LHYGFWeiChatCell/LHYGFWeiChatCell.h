//
//  LHYGFWeiChatCell.h
//  LHYGFWeiChatTableViewCell
//
//  Created by Huoyi Lin on 2017/5/11.
//  Copyright © 2017年 Huoyi Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

#define LYSideslipCellLeftLimitScrollMargin 15  //  Max右划距离
#define LYSideslipButttonsSide 10  //  弹性距离


#define LYSideslipCellRightLimitScrollMargin 20 //右边按钮多的 弹性距离
#define LYSideslipCellBtnWith 150


@interface LHYGFWeiChatCell : UITableViewCell

@property(nonatomic,strong)NSIndexPath *indexPath;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)index;

@end
