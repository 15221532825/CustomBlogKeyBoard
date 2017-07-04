//
//  BlogTool.h
//  CustomBlogKeyBoard
//
//  Created by FeiXiang on 2017/3/17.
//  Copyright © 2017年 飞翔. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ComposeTool.h"
#import "EmotionListView.h"
//自定义键盘工具条

@interface BlogTool : NSObject

+(ComposeTool *)toolWithBlock:(void(^)())blockView;

+(NSArray *)defaultArray;
+(NSArray *)emojiArray;
+(NSArray *)lxhArray;
@end
