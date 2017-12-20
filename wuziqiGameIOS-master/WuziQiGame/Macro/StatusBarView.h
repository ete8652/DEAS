//
//  StatusBarView.h
//  card
//
//  Created by rmbp840 on 17/2/17.
//  Copyright © 2017年 rmbp840. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatusBarView : UIView
@property (weak, nonatomic) IBOutlet UIButton *mainBtn;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UIButton *goBtn;
@property (weak, nonatomic) IBOutlet UIButton *reloadBtn;
@property (weak, nonatomic) IBOutlet UIButton *exitBtn;

+ (StatusBarView *)initView;

@end
