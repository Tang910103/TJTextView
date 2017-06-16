//
//  TJTextView.h
//  TJTextView
//
//  Created by Tang杰 on 2017/6/15.
//  Copyright © 2017年 TangJie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TJTextView : UITextView
/*! 占位符*/
@property (copy, nonatomic) IBInspectable NSString *placeHolder;
/*! 占位符颜色,default lightGrayColor*/
@property (strong, nonatomic) IBInspectable UIColor *placeHolderTextColor;
/*! 最大高度*/
@property (nonatomic, assign) IBInspectable CGFloat maxHeight;
/*! 最小高度*/
@property (nonatomic, assign) IBInspectable CGFloat minHeight;
/*! 最大长度（字数）*/
@property (nonatomic, assign) IBInspectable NSInteger maxLength;
@end
