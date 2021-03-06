//
//  ViewController.m
//  Multiplayer
//
//  Created by lxm on 2017/12/13.
//  Copyright © 2017年 lixiaomeng. All rights reserved.
//

#import "ViewController.h"
#import "CGBroadViewController.h"

NSString* const MUSIC_NAME = @"music.mp3";
NSString* const MOVE_SOUND_NAME = @"move.wav";

@interface ViewController ()
- (IBAction)singleGame_btnClick:(id)sender;
- (IBAction)doubleGame_btnClick:(id)sender;
- (IBAction)LANGame_btnClick:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initPlayers];
}
- (void)initPlayers{
    _musicPlayer = [self playerWithFile:MUSIC_NAME];
    _musicPlayer.numberOfLoops = -1;
    if ([[NSUserDefaults standardUserDefaults] integerForKey:@"music"] == 1){
        [_musicPlayer play];
    }
    _moveSoundPlayer = [self playerWithFile:MOVE_SOUND_NAME];
    if ([[NSUserDefaults standardUserDefaults] integerForKey:@"sound"] == 1){
        _moveSoundPlayer.volume = 1;
    } else {
        _moveSoundPlayer.volume = 0;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (AVAudioPlayer*)playerWithFile:(NSString*)file{
    NSString* path = [[NSBundle mainBundle] pathForResource:file ofType:nil
                      ];
    NSURL* url = [NSURL fileURLWithPath:path];
    AVAudioPlayer* player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [player prepareToPlay];
    return player;
}

- (IBAction)singleGame_btnClick:(id)sender {
    [self performSegueWithIdentifier:@"startGame" sender:sender];
}

- (IBAction)doubleGame_btnClick:(id)sender {
    [self performSegueWithIdentifier:@"startGame" sender:sender];
}

- (IBAction)LANGame_btnClick:(id)sender {
    [self performSegueWithIdentifier:@"startGame" sender:sender];
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"startGame"]) {
        UIButton* btn = (UIButton*)sender;
        NSLog(@"btn name:%@",btn.titleLabel.text);
        CGBroadViewController* vc = (CGBroadViewController*) segue.destinationViewController;
        if ([btn.titleLabel.text isEqualToString:@"Single Game"]){
            vc.gameMode = CGModeSingle;
        } else if ([btn.titleLabel.text isEqualToString:@"Multiplayer Game"]){
            vc.gameMode = CGModeDouble;
        } else if ([btn.titleLabel.text isEqualToString:@"Online Game"]){
            vc.gameMode = CGModeLAN;
        }
    }
}

@end
