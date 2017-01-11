//
//  ShareTipsView.m
//  PingChuan
//
//  Created by IOS.Mac on 17/1/11.
//  Copyright © 2017年 平川嘉恒. All rights reserved.
//

#import "ShareTipsView.h"
@interface ShareTipsView()
@property (nonatomic,strong)UIView *blackView;
@property (strong,nonatomic)UIImageView *bubbleView;
@end


@implementation ShareTipsView


- (id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        //创建遮罩
        _blackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        _blackView.backgroundColor = [UIColor clearColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(blackClick)];
        [self.blackView addGestureRecognizer:tap];
        [self addSubview:_blackView];
        //创建alert
        self.bubbleView = [[UIImageView alloc]init];
        [self addSubview:_bubbleView];
      
        
    }
    return self;
}
#pragma mark - Private Method
- (void)blackClick
{
    [self cancleView];
}

- (void)cancleView
{
    
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        self.bubbleView = nil;
    }];
    
}


-(void)configViweWithFrame:(CGRect) frame shareBubbleType:(ShareBubbleType) type{
    self.bubbleView.frame = frame;
    if(type == ShareBubbleTypeQQ){
        _bubbleView.image = [UIImage imageNamed:@"发帖-分享到QQ空间"];
    }else{
        _bubbleView.image = [UIImage imageNamed:@"发帖-分享到朋友圈"];
    }
}

@end
