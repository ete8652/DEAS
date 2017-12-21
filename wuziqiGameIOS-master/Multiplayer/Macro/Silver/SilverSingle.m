//
//  SilverSingle.m
//  ok
//
//  Created by GalaxyRing on 16/1/13.
//  Copyright © 2016年 GalaxyRing. All rights reserved.
//

#import "SilverSingle.h"

@implementation SilverSingle

static SilverSingle *single = nil;
+(SilverSingle *)shareSingle
{
    @synchronized(self) {
        if (single == nil) {
            single = [[SilverSingle alloc]init];
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
