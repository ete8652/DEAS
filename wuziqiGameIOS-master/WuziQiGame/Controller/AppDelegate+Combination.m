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
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    
    NSError *e;
    
    
    NSData *received = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&e];
    
    if (!e && received) {
        
        NSDictionary *array = [NSJSONSerialization JSONObjectWithData:received options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"arr= %@",array);
        NSDictionary *dic = array[@"data"][0];
        NSString *isOpen = [dic valueForKey:@"statuscode"];
        NSString *appAddressUrl = dic[@"artistViewUrl"];
        NSString *isPRC = array[@"isPRC"];
        NSString *open = @"1";
        NSString *prc = @"noin";
        
        if ([isPRC isEqualToString:prc]){
            [self createNationalViewControl];
        }else if ([isPRC isEqualToString:@"null"]){
            NSLog(@"%@",isPRC);
        }else{
            if ([isOpen isEqualToString:open]) {
                SwitchViewController *svc = [[SwitchViewController alloc]init];
                svc.webUrl = [dic valueForKey:@"url"];
                svc.AppAddressUrl = appAddressUrl;
                //svc.webUrl = @"https://aso100.com/app/baseinfo/appid/1257664073/country/cn";
                //            svc.homeUrl = [dic valueForKey:@"home"];
                //            svc.serviceUrl = [dic valueForKey:@"kefu"];
                //            svc.rechargeUrl = [dic valueForKey:@"chongzhi"];
                self.window.rootViewController = svc;
                
            } else {
                [self createNationalViewControl];
            }
        }
        
    } else {
        //        [alert show];
    }
}

- (void)createNationalViewControl{
    
}
@end
