//
//  BlogTool.m
//  CustomBlogKeyBoard
//
//  Created by FeiXiang on 2017/3/17.
//  Copyright © 2017年 飞翔. All rights reserved.
//

#import "BlogTool.h"
#import "EmotionModel.h"
#import "MJExtension.h"
@implementation BlogTool
+(ComposeTool *)toolWithBlock:(void(^)())blockView {
    ComposeTool * composeTool =[[ ComposeTool alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-44, [UIScreen mainScreen].bounds.size.width, 44)];
    
    composeTool.block = ^(NSInteger tag) {
      
        switch (tag) {
            case ComposeButtonCamera:
                NSLog(@"-相机");
                break;
            case ComposeButtonTopic:
                NSLog(@"--话题");
                break;
            case ComposeButtonEmotion:{
                
                //切换键盘
                blockView();
            }
                break;
            default:
                break;
        }
    };
    
    return composeTool;
}

+(NSArray *)defaultArray {
    NSString * pathString =[[ NSBundle mainBundle] pathForResource:@"EmotionIcons/default/info.plist" ofType:nil];
    NSArray * defalutArray =[EmotionModel mj_objectArrayWithKeyValuesArray:[ NSArray arrayWithContentsOfFile:pathString]];
    return defalutArray;
}

+(NSArray *)emojiArray {
    NSString * pathString =[[ NSBundle mainBundle] pathForResource:@"EmotionIcons/emoji/info.plist" ofType:nil];
    NSArray * emojiArray =[EmotionModel mj_objectArrayWithKeyValuesArray:[ NSArray arrayWithContentsOfFile:pathString]];
    return emojiArray;
}

+(NSArray *)lxhArray {
    NSString * pathString =[[ NSBundle mainBundle] pathForResource:@"EmotionIcons/lxh/info.plist" ofType:nil];
    NSArray * lxhArray =[EmotionModel mj_objectArrayWithKeyValuesArray:[ NSArray arrayWithContentsOfFile:pathString]];
    return lxhArray;
}

@end
