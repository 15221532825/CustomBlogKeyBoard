//
//  NSString+Code.h
//  CustomBlogKeyBoard
//
//  Created by FeiXiang on 2017/3/20.
//  Copyright © 2017年 飞翔. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Code)
 
/**  将十六进制的编码转为emoji字符*/
+ (NSString *)emojiWithIntCode:(int)intCode;

/**将十六进制的编码转为emoji字符*/
+ (NSString *)emojiWithStringCode:(NSString *)stringCode;
- (NSString *)emoji;

/**是否为emoji字符*/

- (BOOL)isEmoji;
@end
