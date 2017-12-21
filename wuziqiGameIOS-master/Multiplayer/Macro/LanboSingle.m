//
//  SilverSingle.m
//  ok
//
//  Created by GalaxyRing on 16/1/13.
//  Copyright © 2016年 GalaxyRing. All rights reserved.
//

#import "LanboSingle.h"

@implementation LanboSingle

static LanboSingle *single = nil;
+(LanboSingle *)shareSingle
{
    @synchronized(self) {
        if (single == nil) {
            single = [[LanboSingle alloc]init];
        }
    }
    return single;
    
}

+(id)allocWithZone:(struct _NSZone *)zone
{
    if (single == nil) {
        single = [super allocWithZone:zone];
    }
    return single;
}

+(void)releaseSingle
{
    
    if (single !=nil) {
        single = nil;
    }
}

@end
