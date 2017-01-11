//
//  ShareTipsView.h
//  PingChuan
//
//  Created by IOS.Mac on 17/1/11.
//  Copyright © 2017年 平川嘉恒. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ShareBubbleType) {
    ShareBubbleTypeWeiChat,//默认从0开始
    ShareBubbleTypeQQ,
};

@interface ShareTipsView : UIView
-(void)configViweWithFrame:(CGRect )frame shareBubbleType:(ShareBubbleType) type;
-(void)cancleView;

@end
