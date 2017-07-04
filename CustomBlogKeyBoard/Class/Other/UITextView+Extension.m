//
//  UITextView+Extension.m
//  CustomBlogKeyBoard
//
//  Created by FeiXiang on 2017/3/21.
//  Copyright © 2017年 飞翔. All rights reserved.
//

#import "UITextView+Extension.h"

@implementation UITextView (Extension)

-(void)insertAttributeText:(NSString *)text {

    NSTextAttachment * attachment =[[ NSTextAttachment alloc]init];
    attachment.image =[ UIImage imageNamed:text];
    attachment.bounds = CGRectMake(0,-2, self.font.lineHeight, self.font.lineHeight);
    NSMutableAttributedString * attributeString =[[ NSMutableAttributedString  alloc]init];
    [attributeString appendAttributedString:self.attributedText];
    NSAttributedString * attribute =[ NSAttributedString attributedStringWithAttachment:attachment];
    NSUInteger location = self.selectedRange.location;
    [attributeString insertAttributedString:attribute atIndex: location];
    [attributeString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, self.text.length)];
    self.attributedText = attributeString;
    //移动光标
    self.selectedRange = NSMakeRange(location +1, 0);
}
@end
