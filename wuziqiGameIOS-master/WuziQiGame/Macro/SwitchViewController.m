//
//  SwitchViewController.m
//  BingoLottery
//
//  Created by 王凯民 on 2017/5/15.
//  Copyright © 2017年 bingo. All rights reserved.
//

#import "SwitchViewController.h"
#import <WebKit/WebKit.h>
#import "StatusBarView.h"
#import "SilverSingle.h"

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

//游戏链接
#define GameURL @"http://h.4399.com/play/192905.htm"
//APP分享的text
#define AppShareText @"应用名字"

@interface SwitchViewController ()<WKUIDelegate,WKNavigationDelegate,UIScrollViewDelegate>
{
    //    MBProgressHUD *_HUD;
    
    SilverSingle *single;
    BOOL isSelect;
}
@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) StatusBarView *statusView;
@property (nonatomic, strong) UIView *shareView; //分享的view
@property (nonatomic, strong) UIButton *topBtn;
@property (nonatomic, strong) UIButton *midBtn;
@property (nonatomic, strong) UIButton *bottomBtn;
@end

@implementation SwitchViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self createWebView];
    [self createShareView];
    
    isSelect = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
     
                                             selector:@selector(screenRotate:animation:) name:@"UIWindowWillRotateNotification" object:nil];
}


-(void)createWebView{
    
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH,SCREEN_HEIGHT)];
    
    if (SCREEN_HEIGHT == 480) {
        self.webView.frame = CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT-20);
    }
    
    self.webView.UIDelegate = self;
    self.webView.allowsBackForwardNavigationGestures = YES;
    //self.webView.backgroundColor = [UIColor blackColor];
    self.webView.navigationDelegate = self;
    self.webView.scrollView.delegate = self;
    //[self.webView.scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:_webUrl]];
    NSLog(@"uuuu = %@",_webUrl);
    [self.webView loadRequest:request];
    //self.webView.suppressesIncrementalRendering = NO;
    [self.view addSubview:self.webView];
    
    if ([self.webUrl isEqualToString:GameURL]) {
        self.statusView.hidden = YES;
    }
    
    // Do any additional setup after loading the view.
    
    //    _HUD = [[MBProgressHUD alloc] init];
    //    [_HUD hide:YES];
    //    [self.view addSubview:_HUD];
    
    single = [SilverSingle alloc];
    
    [self.view addSubview:self.statusView];
    
}
-(void)dealloc{
    
    //[self.webView.scrollView removeObserver:self forKeyPath:@"contentOffset"];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    //NSLog(@"%f", self.webView.scrollView.contentOffset.y);
    //self.statusView.hidden = YES;
}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    self.statusView.hidden = YES;
    self.shareView.hidden = YES;
    self.webView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    self.statusView.hidden = NO;
    self.webView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-49);
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    self.statusView.hidden = NO;
    self.webView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-49);
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    //    self.statusView.hidden = NO;
    //    self.webView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-49);
    //    NSLog(@"2");
}


-(void)createShareView{
    
    if (!self.shareView) {
        self.shareView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-150, SCREEN_HEIGHT-49-100, 150, 100)];
        self.shareView.backgroundColor = [UIColor colorWithRed:30/255.0 green:30/255.0 blue:30/255.0 alpha:0.95];
        self.shareView.layer.cornerRadius = 5.0;
        self.shareView.layer.masksToBounds = YES;
        self.shareView.layer.borderColor = [UIColor whiteColor].CGColor;
        self.shareView.layer.borderWidth = .5;
        self.shareView.hidden = YES;
        [self.view addSubview:self.shareView];
    }
    
    
    if (isSelect) {
        self.shareView.hidden = NO;
    }else{
        self.shareView.hidden = YES;
    }
    
    //createBtn
    if (!self.topBtn) {
        self.topBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
        self.topBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        self.topBtn.layer.borderWidth = .5;
        [self.topBtn setTitle:@"分享" forState:UIControlStateNormal];
        [self.topBtn setImage:[UIImage imageNamed:@"分享"] forState:UIControlStateNormal];
        [self.topBtn setImageEdgeInsets:UIEdgeInsetsMake(15, 43, 15, 80)];
        [self.topBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -45, 0, 0)];
        [self.topBtn addTarget:self action:@selector(topBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [self.shareView addSubview:self.topBtn];
        
        //        self.midBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 50, 150, 50)];
        //        self.midBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        //        self.midBtn.layer.borderWidth = .5;
        //        [self.midBtn setTitle:@"消息" forState:UIControlStateNormal];
        //        [self.midBtn setImage:[UIImage imageNamed:@"消息"] forState:UIControlStateNormal];
        //        [self.midBtn setImageEdgeInsets:UIEdgeInsetsMake(15, 43, 15, 80)];
        //        [self.midBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -45, 0, 0)];
        //        [self.midBtn addTarget:self action:@selector(midBtnAction) forControlEvents:UIControlEventTouchUpInside];
        //        [self.shareView addSubview:self.midBtn];
        
        self.bottomBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 50, 150, 50)];
        self.bottomBtn.layer.borderColor = [UIColor whiteColor].CGColor;
        self.bottomBtn.layer.borderWidth = .5;
        [self.bottomBtn setTitle:@"清除缓存" forState:UIControlStateNormal];
        [self.bottomBtn setImage:[UIImage imageNamed:@"扫把"] forState:UIControlStateNormal];
        [self.bottomBtn setImageEdgeInsets:UIEdgeInsetsMake(15, 20, 15, 100)];
        [self.bottomBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -55, 0, 0)];
        [self.bottomBtn addTarget:self action:@selector(bottomBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [self.shareView addSubview:self.bottomBtn];
    }
    
    
    
}

#pragma mark----wkwebviewDelegate (解决WKWebView不能跳转App Store的问题)
// 接收到服务器跳转请求之后调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation {
    
    NSLog(@"alksjdklasjdaskldsaldsa = %@",webView.URL.absoluteString);
    
    if ([webView.URL.absoluteString hasPrefix:@"itms-appss://"]) {
        [[UIApplication sharedApplication] openURL:webView.URL];
        
    }
    
}
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    NSURL *URL = navigationAction.request.URL;
    NSString *scheme = [URL scheme];
    UIApplication *app = [UIApplication sharedApplication];
    // 打电话
    if ([scheme isEqualToString:@"tel"]) {
        if ([app canOpenURL:URL]) {
            [app openURL:URL];
            // 一定要加上这句,否则会打开新页面
            decisionHandler(WKNavigationActionPolicyCancel);
            return;
        }
    }
    // 打开appstore
    if ([URL.absoluteString containsString:@"itunes.apple.com"]) {
        if ([app canOpenURL:URL]) {
            [app openURL:URL];
            decisionHandler(WKNavigationActionPolicyCancel);
            return;
        }
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(null_unspecified WKNavigation *)navigation{
    
    if ([_webUrl isEqualToString:GameURL]) {
        
        //[NSThread sleepForTimeInterval:6.0];
        
        //JS注入语句
        [webView evaluateJavaScript:@"isblack = 0;" completionHandler:^(id _Nullable response, NSError * _Nullable error) {
        }];
    }
    
    //    self.statusView.hidden = NO;
    //    self.webView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-49);
}


- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    
    single.is_Load = true;
    
    if ([_webUrl isEqualToString:GameURL]) {
        
        //[NSThread sleepForTimeInterval:2.0];
        
        //JS注入语句
        [webView evaluateJavaScript:@"isblack = 0;" completionHandler:^(id _Nullable response, NSError * _Nullable error) {
            
        }];
        
    }
    
    //    self.statusView.hidden = NO;
    //    self.webView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-49);
}



- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error{
    
    NSLog(@"error = %@",error);
    
}
- (void)screenRotate:(NSNotification *)noti animation:(BOOL)animation
{
    UIInterfaceOrientation orientation = [[noti.userInfo objectForKey:@"UIWindowNewOrientationUserInfoKey"] integerValue];
    //    if (!noti) {
    //        return;
    //    }
    //    animation = YES;
    //
    //    NSTimeInterval i = [UIApplication sharedApplication].statusBarOrientationAnimationDuration;
    //    NSTimeInterval time = 0.3 + i;
    //
    //    if (!animation) {
    //        time = 0.0;
    //    }
    switch (orientation)
    {
        case UIInterfaceOrientationPortrait:
        {
            NSLog(@"1");
            self.webView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-49);
            self.webView.scrollView.delegate = self;
            self.statusView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 49, [UIScreen mainScreen].bounds.size.width, 49);
            self.statusView.hidden = NO;
            
        }
            break;
        case UIInterfaceOrientationPortraitUpsideDown:
        {
            NSLog(@"2");
        }
            break;
            
        case UIInterfaceOrientationLandscapeRight:
        {
            // 这里是给相应的view对应旋转
            //            [UIView animateWithDuration:time animations:^{
            //                _userVc.view.transform = CGAffineTransformMakeRotation(M_PI_2);
            //            } completion:nil];
            self.webView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            self.webView.scrollView.delegate = nil;
            //            _statusView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 49, [UIScreen mainScreen].bounds.size.width, 49);
            NSLog(@"3");
        }
            break;
            
        case UIInterfaceOrientationLandscapeLeft:
        {
            // 这里是给相应的的view对应旋转
            //            [UIView animateWithDuration:time animations:^{
            //                _userVc.view.transform = CGAffineTransformMakeRotation(-M_PI_2);
            //            } completion:nil];
            
            NSLog(@"4");
            self.webView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            self.webView.scrollView.delegate = nil;
            //            _statusView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 49, [UIScreen mainScreen].bounds.size.width, 49);
        }
            break;
        default:
            break;
    }
}

- (void)MainBtnClick{
    NSLog(@"首页");
    self.shareView.hidden = YES;
    _statusView.exitBtn.selected = NO;
    isSelect = NO;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.webUrl]]];
}
-(void)GoForwardClick{
    NSLog(@"前进");
    self.shareView.hidden = YES;
    _statusView.exitBtn.selected = NO;
    isSelect = NO;
    [self.webView goForward];
}
-(void)clearClick{
    NSLog(@"清除");
    isSelect = !isSelect;
    _statusView.exitBtn.selected = !_statusView.exitBtn.selected;
    [self createShareView];
}
- (void)BackBtnClick{
    NSLog(@"后退");
    self.shareView.hidden = YES;
    _statusView.exitBtn.selected = NO;
    isSelect = NO;
    [self.webView goBack];
}
- (void)GoBtnClick{
    NSLog(@"客服");
    self.shareView.hidden = YES;
    _statusView.exitBtn.selected = NO;
    isSelect = NO;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.serviceUrl]]];
}
- (void)ReloadBtnClick{
    NSLog(@"充值");
    self.shareView.hidden = YES;
    _statusView.exitBtn.selected = NO;
    isSelect = NO;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.rechargeUrl]]];
}
- (void)ExitBtnClick{
    NSLog(@"刷新");
    self.shareView.hidden = YES;
    _statusView.exitBtn.selected = NO;
    isSelect = NO;
    [self.webView reload];
}


-(void)topBtnAction{
    NSLog(@"点击了分享");
    
    // 设置分享内容
    NSString *text = AppShareText;
    //NSURL *url = [NSURL URLWithString:@"http://itunes.apple.com/us/app/id1266209243"];
    NSURL *url = [NSURL URLWithString:self.AppAddressUrl];
    NSArray *activityItems = @[text,url];
    
    // 服务类型控制器
    UIActivityViewController *activityViewController =
    [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    activityViewController.modalInPopover = true;
    [self presentViewController:activityViewController animated:YES completion:nil];
    
    //去掉某个分享类型
    //activityViewController.excludedActivityTypes = @[UIActivityTypeOpenInIBooks];
    
    
    
    // 当前选中的分享类型
    [activityViewController setCompletionWithItemsHandler:^(NSString * __nullable activityType, BOOL completed, NSArray * __nullable returnedItems, NSError * __nullable activityError){
        
        // 显示选中的分享类型
        NSLog(@"选中的分享类型是===%@",activityType);
        
        if (completed) {
            NSLog(@"分享完成！！！！！！");
        }else {
            NSLog(@"分享失败！！！！！！");
        }
        
    }];
}
-(void)midBtnAction{
    NSLog(@"点击了消息");
}
-(void)bottomBtnAction{
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"提示" message:@"缓存已清除" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [av show];
}

- (StatusBarView *)statusView
{
    if(!_statusView)
    {
        _statusView = [[StatusBarView initView] init];
        _statusView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 49, [UIScreen mainScreen].bounds.size.width, 49);
        [_statusView.mainBtn addTarget:self action:@selector(BackBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_statusView.backBtn addTarget:self action:@selector(GoForwardClick) forControlEvents:UIControlEventTouchUpInside];
        [_statusView.goBtn addTarget:self action:@selector(MainBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_statusView.reloadBtn addTarget:self action:@selector(ExitBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_statusView.exitBtn addTarget:self action:@selector(clearClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _statusView ;
}
- (BOOL)shouldAutorotate
{
    return YES;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

@end
