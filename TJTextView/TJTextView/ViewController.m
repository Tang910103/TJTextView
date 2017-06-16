//
//  ViewController.m
//  TJTextView
//
//  Created by Tang杰 on 2017/6/15.
//  Copyright © 2017年 TangJie. All rights reserved.
//

#import "ViewController.h"
#import "TJTextView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet TJTextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewTextDidChangeNotification) name:UITextViewTextDidChangeNotification object:self.textView];
}

- (void)textViewTextDidChangeNotification
{
    NSLog(@"%ld",self.textView.text.length);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
