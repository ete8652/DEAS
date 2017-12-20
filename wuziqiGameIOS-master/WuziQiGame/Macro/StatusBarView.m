//
//  StatusBarView.m
//  card
//
//  Created by rmbp840 on 17/2/17.
//  Copyright © 2017年 rmbp840. All rights reserved.
//

#import "StatusBarView.h"

@implementation StatusBarView

+ (StatusBarView *)initView{
    NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"StatusBarView" owner:nil options:nil];
    return arr[0];
}

-(void)layoutSubviews{
    CGRect frame= self.frame;
    frame.size.width = [UIScreen mainScreen].bounds.size.width;
    frame.size.height = 49;
    [self setFrame:frame];
}
@end
