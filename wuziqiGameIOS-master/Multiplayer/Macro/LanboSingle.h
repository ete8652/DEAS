//
//  SilverSingle.h
//  ok
//
//  Created by GalaxyRing on 16/1/13.
//  Copyright © 2016年 GalaxyRing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LanboSingle : NSObject
@property(nonatomic,copy)NSString *string;
@property(nonatomic,assign)BOOL is_Load;
+(LanboSingle *)shareSingle;
+(void)releaseSingle;


@end
