//
//  ViewController.h
//  Bad Breath test
//
//  Created by Prashant Singh Rathore on 07/04/14.
//  Copyright (c) 2014 AppStarz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
//#import <RevMobAds/RevMobAds.h>
@interface ViewController : UIViewController
{
    UIImageView* imgView1;
    UIButton* mBtn;
    BOOL isMale;
    UIImage *Mint;
    BOOL isAnimationMint;
    int Score;
    int Chance;
    AVAudioPlayer *PositiveAudioPlayer;
    AVAudioPlayer *NegativeAudioPlayer;
    AVAudioPlayer* Beep;
    int i;
    UIButton* volumnMute;
    NSTimer* myTimer;
    BOOL isMusicOn;
    NSInteger index;
   // RevMobBannerView *revBannerView;
}
-(void)MintMiniLaunch;
@end
