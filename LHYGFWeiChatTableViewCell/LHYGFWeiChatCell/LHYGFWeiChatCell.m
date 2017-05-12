//
//  LHYGFWeiChatCell.m
//  LHYGFWeiChatTableViewCell
//
//  Created by Huoyi Lin on 2017/5/11.
//  Copyright © 2017年 Huoyi Lin. All rights reserved.
//

#import "LHYGFWeiChatCell.h"
#import "LHYGFWeiChatCellButtonsView.h"

@interface LHYGFWeiChatCell()<UIGestureRecognizerDelegate>


@property(nonatomic,strong)UIPanGestureRecognizer *panGesture;
@property(nonatomic,strong)UITapGestureRecognizer *tapGesture;
@property(nonatomic,strong)UIView *contentCellView;
@property(nonatomic,strong)LHYGFWeiChatCellButtonsView *contentBacKButtonsView;
@property(nonatomic,assign)CGRect cellFrame;



@end

@implementation LHYGFWeiChatCell

//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier indexPath:(NSIndexPath *)index;{
//    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        
//        self.indexPath = [NSIndexPath indexPathForRow:index.row inSection:index.section];
//     
//        self.textLabel.text = [NSString stringWithFormat:@"%ld",(long)self.indexPath.row];
//        [self setupSideslipCell];
//        
//    }
//    return self;
//}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
     
        [self setupSideslipCell];
    }
    return self;
}
//- (instancetype)initWithCoder:(NSCoder *)aDecoder {
//    if (self = [super initWithCoder:aDecoder]) {
//        [self setupSideslipCell];
//    }
//    return self;
//}
- (void)setupSideslipCell {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(funn:) name:@"DFDF" object:nil];
    
    _contentCellView = [UIView new];
    self.contentBacKButtonsView = [[LHYGFWeiChatCellButtonsView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
//    self.contentBacKButtonsView.backgroundColor = [UIColor redColor];
    self.contentBacKButtonsView.userInteractionEnabled = YES;
    
    _contentCellView.backgroundColor = [UIColor lightGrayColor];
    NSArray *cellSubViews = self.subviews;
    [self.contentBacKButtonsView addSubview:self.contentCellView];
    [self insertSubview:self.contentBacKButtonsView atIndex:0];
    for (UIView *subView in cellSubViews) {
        [_contentCellView addSubview:subView];
    }
    _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(contentCellViewPan:)];
    _panGesture.delegate = self;
    [_contentCellView addGestureRecognizer:_panGesture];
    
    _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(huoyiTap:)];
    _tapGesture.delegate = self;
    [_contentCellView addGestureRecognizer:_tapGesture];
    
    self.cellFrame = _contentCellView.frame;
    
    [self addObserver:self forKeyPath:@"contentCellView.frame" options:NSKeyValueObservingOptionNew context:NULL];
    
}


- (void)contentCellViewPan:(UIPanGestureRecognizer *)pan {

   
    if (pan.state == UIGestureRecognizerStateChanged) {
        CGPoint point = [pan translationInView:pan.view];
        [pan setTranslation:CGPointZero inView:pan.view];
        CGRect frame = _contentCellView.frame;
        frame.origin.x += point.x;
        _contentCellView.frame = frame;
        
        if (frame.origin.x > LYSideslipCellLeftLimitScrollMargin) {
            frame.origin.x = LYSideslipCellLeftLimitScrollMargin;
        }
        else if (frame.origin.x < -LYSideslipCellRightLimitScrollMargin - LYSideslipCellBtnWith) {
                    frame.origin.x = -LYSideslipCellRightLimitScrollMargin - LYSideslipCellBtnWith;

        }
        _contentCellView.frame = frame;
    }else if (pan.state == UIGestureRecognizerStateEnded)
    {
        if ([self isGragShowLeft]) {
            [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                CGRect frame = _contentCellView.frame;
                frame.origin.x = 0;
                [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"LHYGFViewRightIsChange"];
                frame.origin.x -=  LYSideslipButttonsSide;
                _contentCellView.frame = frame;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                    CGRect frame = _contentCellView.frame;
                     [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"LHYGFViewRightIsChange"];
                    frame.origin.x += LYSideslipButttonsSide;
                    _contentCellView.frame = frame;
                    
                } completion:^(BOOL finished) {
                    
                }];
            }];

            
        }else
        {
           
            [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
                CGRect frame = _contentCellView.frame;
                if (frame.origin.x  < - LYSideslipCellBtnWith) {
                    frame.origin.x = - LYSideslipCellBtnWith;
                    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"LHYGFShowButtons"];
                }
                if (frame.origin.x  > - LYSideslipCellBtnWith) {
                    NSLog(@"xxx");
                    frame.origin.x = 0;
                    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"LHYGFShowButtons"];
                }
                
                _contentCellView.frame = frame;
            } completion:^(BOOL finished) {

            }];
        }

      
    }

}
- (void)layoutSubviews {
    [super layoutSubviews];
    _contentCellView.frame = self.bounds;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    if (gestureRecognizer == _panGesture) {
       
        
        UIPanGestureRecognizer *gesture = (UIPanGestureRecognizer *)gestureRecognizer;
        CGPoint translation = [gesture translationInView:gesture.view];
//        NSLog(@"YYY  %f",translation.y);
//        NSLog(@"xxx  %f",translation.x);
        BOOL isH = fabs(translation.y) <= fabs(translation.x);
        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"LHYGFShowButtons"] && isH == NO) {
            NSNotification *noti = [[NSNotification alloc]initWithName:@"DFDF" object:nil userInfo:@{@"index":self.indexPath,@"isH":@(isH)}];
            [[NSNotificationCenter defaultCenter] postNotification:noti];
        
        }else if ([[NSUserDefaults standardUserDefaults] boolForKey:@"LHYGFShowButtons"] && isH == YES)
        {
            NSNotification *noti = [[NSNotification alloc]initWithName:@"DFDF" object:nil userInfo:@{@"index":self.indexPath,@"isH":@(isH)}];
            [[NSNotificationCenter defaultCenter] postNotification:noti];
        }
        return isH;
    }
    return YES;
}
-(BOOL)isGragShowLeft;
{
        CGRect frame = _contentCellView.frame;
//            NSLog(@"contentCellViewPan %f",frame.origin.x);
    if (frame.origin.x > 0) {
        // 右滑动
        return YES;
    }else
    {
        return NO;
    }
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"%@",change);
    if (self.contentCellView.frame.origin.x > 0) { //show 左边
        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"LHYGFViewRightIsChange"]) {
            self.contentBacKButtonsView.rightButtonsView.hidden = YES;
            self.contentBacKButtonsView.leftButtonsView.hidden = NO;
        }else
        {
            self.contentBacKButtonsView.rightButtonsView.hidden = NO;
            self.contentBacKButtonsView.leftButtonsView.hidden = YES;
        }


    }else
    {// show  右边 边
        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"LHYGFViewRightIsChange"]) {
            self.contentBacKButtonsView.rightButtonsView.hidden = NO;
            self.contentBacKButtonsView.leftButtonsView.hidden = YES;
           
        }else
        {
            self.contentBacKButtonsView.rightButtonsView.hidden = YES;
            self.contentBacKButtonsView.leftButtonsView.hidden = NO;
        }
    }

}
//用来缩回 cell
-(void)funn:(NSNotification *)noti;
{
    NSLog(@"noti %@",noti.userInfo);
    if ([noti.userInfo[@"isH"] boolValue] == YES && self.indexPath != noti.userInfo[@"index"]) {
        CGRect frame = _contentCellView.frame;
        frame.origin.x = 0;
        _contentCellView.frame = frame;
        [UIView animateWithDuration:0.05 delay:0.25 options:UIViewAnimationOptionCurveLinear
                         animations:^{
          
        } completion:^(BOOL finished) {
            
        }];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"LHYGFShowButtons"];
    }else if ([noti.userInfo[@"isH"] boolValue] == NO)
    {
        [UIView animateWithDuration:0.25 delay:0.25 options:UIViewAnimationOptionCurveLinear animations:^{
            CGRect frame = _contentCellView.frame;
            frame.origin.x = 0;
            _contentCellView.frame = frame;
        } completion:^(BOOL finished) {
            
        }];
    }
    
   
}
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"DFDF" object:nil];
    
    [self removeObserver:self forKeyPath:@"contentCellView.frame"];
}

-(void)huoyiTap:(UITapGestureRecognizer *)tap;
{
//    NSLog(@"TAp xxx %@",self.indexPath);
//    self.tag = self.indexPath.row;
    NSNotification *noti = [[NSNotification alloc]initWithName:@"DFDF" object:nil userInfo:@{@"index":self.indexPath,@"isH":@(NO)}];
    [[NSNotificationCenter defaultCenter] postNotification:noti];
    

}

//- (NSIndexPath *)indexPath
//{
//    if (_indexPath == nil) {
//        // 初始化
//        _indexPath = [[NSIndexPath alloc] init];
//    }
//    return _indexPath;
//}
//-(void)setIndexPath:(NSIndexPath *)indexPath
//{
//    _indexPath = indexPath;
//}
@end
