//
//  EmotionModel.h
//  CustomBlogKeyBoard
//
//  Created by FeiXiang on 2017/3/20.
//  Copyright © 2017年 飞翔. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EmotionModel : NSObject
/** 表情的文字描述 */
@property (nonatomic, copy) NSString *chs;
/** 表情的png图片名 */
@property (nonatomic, copy) NSString *png;
/** emoji表情的16进制编码 */
@property (nonatomic, copy) NSString *code;

@end
