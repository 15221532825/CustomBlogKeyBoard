//
//  SelectedView.h
//  CustomBlogKeyBoard
//
//  Created by FeiXiang on 2017/3/20.
//  Copyright © 2017年 飞翔. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Block) (NSInteger btnTag);

typedef NS_ENUM(NSInteger,SelectedType) {
    selectedCurrent,//最近
    selectedCustiom,//自定义
    selectedEmotion,//表情
    selectedLxh//浪小花
};

@interface SelectedView : UIView

@property(nonatomic,copy) Block clickBlock;

@end
