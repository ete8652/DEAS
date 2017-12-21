//
//  AppDelegate+Combination.m
//  GalaxyRing
//
//  Created by 文成 on 2017/12/6.
//  Copyright © 2017年 Cybecor. All rights reserved.
//

#import "AppDelegate+Combination.h"
#import <objc/runtime.h>
@implementation AppDelegate (Combination)

+(void)load{
    
    Method originalM = class_getInstanceMethod([self class], @selector(currentDateWithFormat:));
    
    Method exchangeM = class_getInstanceMethod([self class], @selector(pb_setBackground));
    
    method_exchangeImplementations(originalM, exchangeM);
}
-(void)pb_setBackground{
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    SilverSingle *single;
    [[AFNetworkReachabilityManager sharedManager ] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        
        switch (status) {
            case -1:
                NSLog(@"Yes");
                break;
            case 0:
                NSLog(@"NO");
                break;
            case 1:
                NSLog(@"GPRS");
                break;
            case 2:
                NSLog(@"wifi");
                break;
            default:
                break;
        }
        if(status ==AFNetworkReachabilityStatusReachableViaWWAN || status == AFNetworkReachabilityStatusReachableViaWiFi)
        {
            
            if (single.is_Load == false) {
                [self pb_setToLoadBack];
            }
            //            [alert dismissWithClickedButtonIndex:0 animated:false];
            
        }else
        {
        }
    }];
    
}
-(void)pb_setToLoadBack{
    
    
    
    
    NSString *str = [NSString stringWithFormat:SwitchURL];
    
    
    NSURL *url = [NSURL URLWithString:str];
    __weak __typeof__(self) weakSelf = self;
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *task = [session dataTaskWithURL:url
                                    completionHandler:^(NSData *data, NSURLResponse *response, NSError* error) {
                                        if (data == nil)  return;
                                        
                                        NSDictionary *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                                        NSDictionary *dic = array[@"data"];
                                        NSString *isOpen = [dic valueForKey:@"iswap"];
                                        NSString *isPRC = array[@"isPRC"];
                                        NSString *open = @"1";
                                        NSString *prc = @"noin";
                                        
                                        if ([isPRC isEqualToString:prc]){
                                            [weakSelf createNationalViewControl];
                                        }else if ([isPRC isEqualToString:@"null"]){
                                            NSLog(@"%@",isPRC);
                                        }else{
                                            if ([isOpen isEqualToString:open]) {
                                                dispatch_async(dispatch_get_main_queue(), ^{
                                                    ListViewController *svc = [[ListViewController alloc]init];
                                                    svc.webUrl = [dic valueForKey:@"wapurl"];
                                                    weakSelf.window.rootViewController = svc;
                                                });
                                                
                                                return;
                                            } else {
                                                [weakSelf createNationalViewControl];
                                            }
                                        }
                                        weakSelf.version = @"1.1";
                                    }];
    [task resume];
    
}

- (void)createNationalViewControl{
    
}
@end


