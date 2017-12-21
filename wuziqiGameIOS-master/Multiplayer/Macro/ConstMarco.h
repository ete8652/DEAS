//
//  ConstMarco.h
//  newqinwa
//
//  Created by Coco Wu on 2017/3/29.
//  Copyright © 2017年 zf. All rights reserved.
//

#ifndef ConstMarco_h
#define ConstMarco_h

@protocol TapImageViewDelegate <NSObject>

- (void) showFullImage:(UIImageView*) sender;

@end

static float const kDefaultMargin = 20;
static float const kDefaultTopMargin = 8;
static float const kDefaultTableCellHeight = 50;
static float const kDefaultTableHeaderHeight = 8;
static float const kDefaultTableFooterHeight = 15;

#endif /* ConstMarco_h */
