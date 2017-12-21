//
//  ShowViewController.m
//  Multiplayer
//
//  Created by Mia on 2017/12/20.
//  Copyright © 2017年 lixiaomeng. All rights reserved.
//

#import "ShowViewController.h"

@interface ShowViewController ()

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateGame{
    
    UIStoryboard *stroyB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [stroyB instantiateInitialViewController];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIApplication sharedApplication].keyWindow.rootViewController = vc;
    });
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"version"]) {
        
        [self updateGame];
        
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
