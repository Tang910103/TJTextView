//
//  TJTextView.m
//  TJTextView
//
//  Created by Tang杰 on 2017/6/15.
//  Copyright © 2017年 TangJie. All rights reserved.
//

#import "TJTextView.h"

@implementation TJTextView

- (void)initialConfig
{
    self.font = self.font ? : [UIFont systemFontOfSize:15.f];
    _placeHolderTextColor = [UIColor lightGrayColor];
    _minHeight = self.font.lineHeight;
    _maxLength = NSIntegerMax;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewTextDidChangeNotification) name:UITextViewTextDidChangeNotification object:self];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialConfig];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self initialConfig];
    }
    
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:self];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize sizeThatFits = [self sizeThatFits:self.frame.size];
    float newHeight = sizeThatFits.height;
    
    if (self.maxHeight) {
        newHeight = MIN(newHeight, self.maxHeight);
    }
    
    if (self.minHeight) {
        newHeight = MAX(newHeight, self.minHeight);
    }
    
    CGRect frame = self.frame;
    frame.size.height = newHeight;
    self.frame = frame;
}

- (void)setFrame:(CGRect)bounds
{
    [super setFrame:bounds];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    if ([self.text length] == 0 && self.placeHolder) {
        [self.placeHolder drawInRect:CGRectInset(rect, 5.0f, 7.0f)
                      withAttributes:[self placeholderTextAttributes]];
    }
}

- (NSDictionary *)placeholderTextAttributes
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paragraphStyle.alignment = self.textAlignment;
    
    return @{ NSFontAttributeName : self.font,
              NSForegroundColorAttributeName : self.placeHolderTextColor,
              NSParagraphStyleAttributeName : paragraphStyle };
}

- (void)textViewTextDidChangeNotification
{
    [self setNeedsDisplay];
    
    if (self.maxLength < self.text.length) {
        self.text = [self.text substringToIndex:self.maxLength];
    }
}

@end
