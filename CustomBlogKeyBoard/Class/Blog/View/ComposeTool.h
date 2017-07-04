//
//  ComposeTool.h
//  CustomBlogKeyBoard
//
//  Created by FeiXiang on 2017/3/16.
//  Copyright © 2017年 飞翔. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^Block)(NSInteger  tag);
typedef NS_ENUM(NSInteger,ComposeButtonType){
    
    ComposeButtonCamera,//相机
    ComposeButtonTrend,//#
    ComposeButtonTopic,//话题
    ComposeButtonEmotion//表情
};

@interface ComposeTool : UIView

@property(nonatomic,assign) ComposeButtonType type;
@property(nonatomic,copy) Block block;

@end
