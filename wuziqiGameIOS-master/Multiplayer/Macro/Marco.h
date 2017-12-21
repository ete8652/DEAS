//
//  Marco.h
//  newqinwa
//
//  Created by Coco Wu on 2017/3/29.
//  Copyright © 2017年 zf. All rights reserved.
//

#ifndef Marco_h
#define Marco_h

#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height
#define VIEW_HEIGHT     SCREEN_HEIGHT - 64
#define REDIO           SCREEN_WIDTH / 375

#define DEFAULT_HEIGHT  50 * REDIO

#define APP_ROOT_CONTROLLER    [UIApplication sharedApplication].keyWindow.rootViewController

#define HWEmotionDidSelectNotification  @"HWEmotionDidSelectNotification"
#define HWSelectEmotionKey              @"HWSelectEmotionKey"
#define HWEmotionDidDeleteNotification  @"HWEmotionDidDeleteNotification"
#define HWEmotionDidSendNotification    @"HWEmotionDidSendNotification"

#define KUserHeaderURL                @"HEADERURL"
#define KUserHeaderImageData          @"KUserHeaderImageData"
#define kUserName                     @"userName"
#define kUserPhone                    @"userName"
#define kUserPsd                      @"userPsd"
#define kUserId                       @"userId"
//#define kUserInfo                     @"userInfo"
#define KJI_FEN                       @"jifen"
#define KUser_Code                    @"code"
#define KNickName                     @"nickName"
#define kUserCash                     @"userCash"
#define kUserVipLevel                 @"vipLevel"
#define kUserUpExp                    @"vipUpExp"
#define kUserType                     @"userType"
//是否审核
#define KUPAtesTate                   @"upatestate"
//积分级别
#define KPintValue                    @"pintValue"


/* ***********************              debug               ********************* */
#ifdef DEBUG

#define DebugLog( s, ... ) NSLog( @"< %@:(%d) > %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )

#else

#define DebugLog( s, ... )

#endif

/* ***********************              color               ********************* */

#define black_color     [UIColor blackColor]
#define blue_color      [UIColor blueColor]
#define brown_color     [UIColor brownColor]
#define clear_color     [UIColor clearColor]
#define darkGray_color  [UIColor darkGrayColor]
#define darkText_color  [UIColor darkTextColor]
#define white_color     [UIColor whiteColor]
#define yellow_color    [UIColor yellowColor]
#define red_color       [UIColor redColor]
#define orange_color    [UIColor orangeColor]
#define purple_color    [UIColor purpleColor]
#define lightText_color [UIColor colorWithWhite153]
#define lightGray_color [UIColor lightGrayColor]
#define green_color     [UIColor greenColor]
#define gray_color      [UIColor grayColor]
#define magenta_color   [UIColor magentaColor]
#define main_color      RGBCOLOR(53, 133, 247)
#define text_color      RGB16(0x4d4b4b)
#define text_font       H16

// 颜色(RGB)
#define RGBCOLOR(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define RGB16(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RGBA16(rgbaValue) [UIColor colorWithRed:((float)((rgbaValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbaValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbaValue & 0xFF))/255.0 alpha:((float)((rgbaValue & 0xFF000000) >> 24))/255.0]

/*       font       */
#define H8      [UIFont systemFontOfSize:8]
#define H9      [UIFont systemFontOfSize:9]
#define H10     [UIFont systemFontOfSize:10]
#define H11     [UIFont systemFontOfSize:11]
#define H12     [UIFont systemFontOfSize:12]
#define H14     [UIFont systemFontOfSize:14]
#define H16     [UIFont systemFontOfSize:16]
#define H18     [UIFont systemFontOfSize:18]
#define H20     [UIFont systemFontOfSize:20]
#define H22     [UIFont systemFontOfSize:22]
#define H24     [UIFont systemFontOfSize:24]
#define H30     [UIFont systemFontOfSize:30]

#define HB8      [UIFont boldSystemFontOfSize:8]
#define HB9      [UIFont boldSystemFontOfSize:9]
#define HB10     [UIFont boldSystemFontOfSize:10]
#define HB11     [UIFont boldSystemFontOfSize:11]
#define HB12     [UIFont boldSystemFontOfSize:12]
#define HB14     [UIFont boldSystemFontOfSize:14]
#define HB16     [UIFont boldSystemFontOfSize:16]
#define HB18     [UIFont boldSystemFontOfSize:18]
#define HB24     [UIFont boldSystemFontOfSize:24]
#define HB30     [UIFont boldSystemFontOfSize:30]

/** 时间间隔 */
#define kHUDDuration            (1.f)

/** 一天的秒数 */
#define SecondsOfDay            (24.f * 60.f * 60.f)

/** 秒数 */
#define Seconds(Days)           (24.f * 60.f * 60.f * (Days))

/** 一天的毫秒数 */
#define MillisecondsOfDay       (24.f * 60.f * 60.f * 1000.f)

/** 毫秒数 */
#define Milliseconds(Days)      (24.f * 60.f * 60.f * 1000.f * (Days))


#define URL(url)            [NSURL URLWithString:url]
#define IMAGE(imageName)    [UIImage imageNamed:imageName]
#define stringEmpty         @""
#define string(str1,str2)   [NSString stringWithFormat:@"%@%@",str1,str2]
#define intToString(int)    [NSString stringWithFormat:@"%d",int]
#define s_str(str1)         [NSString stringWithFormat:@"%@",str1]
#define s_int(str,int)      [NSString stringWithFormat:@"%@%d",str,int]
#define s_Num(num1)         [NSString stringWithFormat:@"%d",num1]
#define s_float(num1)       [NSString stringWithFormat:@"%f",num1]
#define s_Integer(num1)     [NSString stringWithFormat:@"%ld",num1]



#endif /* Marco_h */
