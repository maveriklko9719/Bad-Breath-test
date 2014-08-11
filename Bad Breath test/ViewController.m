//
//  ViewController.m
//  Bad Breath test
//
//  Created by Prashant Singh Rathore on 07/04/14.
//  Copyright (c) 2014 AppStarz. All rights reserved.
//

#import "ViewController.h"
//#import "SHK.h"
#import "MKStoreManager.h"
//#import <AVFoundation/AVFoundation.h>
#import <Social/Social.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
   // [RevMobAds startSessionWithAppID:@"533ee27c23baf02027159df1"];
    index = 0;
    isMusicOn = true;
    isAnimationMint = false;
    Score = 0;
    Chance = 0;
    i = 3;
    isMale = false;
    [super viewDidLoad];
    [self LoadLandingPage];
    NSString *filePath2 = [[NSBundle mainBundle] pathForResource:@"beep"
                                                         ofType:@"mp3"];
    NSURL *fileURL2 = [[NSURL alloc] initFileURLWithPath:filePath2];
    Beep = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL2 error:nil];
  
    
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"applause-sound"
                                                         ofType:@"mp3"];
    // Convert the file path to a URL.
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:filePath];
    //Initialize the AVAudioPlayer.
    PositiveAudioPlayer = [[AVAudioPlayer alloc]
                        initWithContentsOfURL:fileURL error:nil];
    // Preloads the buffer and prepares the audio for playing.
    [PositiveAudioPlayer prepareToPlay];
    NSString *filePath1 = [[NSBundle mainBundle] pathForResource:@"fart-sound"
                                                         ofType:@"mp3"];
    
    // Convert the file path to a URL.
    NSURL *fileURL1 = [[NSURL alloc] initFileURLWithPath:filePath1];
    
    //Initialize the AVAudioPlayer.
    NegativeAudioPlayer = [[AVAudioPlayer alloc]
                           initWithContentsOfURL:fileURL1 error:nil];
    
    // Preloads the buffer and prepares the audio for playing.
    [NegativeAudioPlayer prepareToPlay];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)LoadLandingPage
{
    Score = 0;
    isAnimationMint = false;
    UIImage *image = [UIImage imageNamed: @"BadTest-5.png"];
    imgView1 = [[UIImageView alloc] initWithImage:image];
    imgView1.backgroundColor = [UIColor blackColor];
    imgView1.frame = CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height);
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    UIButton* playButton = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth/2 - 154/2, screenHeight/2 + screenHeight/4, 154, 70)];
    [playButton setImage:[UIImage imageNamed: @"Play_Button.png"] forState:UIControlStateNormal];
    [playButton addTarget: self action: @selector(onPlayButtonPressed) forControlEvents: UIControlEventTouchUpInside];
    
    [self.view addSubview:imgView1];
    [self.view addSubview:playButton];
}
-(void)DisableLandingPage
{
    for (UIView *subview in [self.view subviews])
        [subview removeFromSuperview];
}
-(void)onPlayButtonPressed
{
    [self DisableLandingPage];
    [self LoadSelectionPage];
}

-(void)LoadSelectionPage
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;

    isAnimationMint = false;
    self.view.backgroundColor = [UIColor blueColor];
    UIButton* Male = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth/2-154/2, screenHeight/3, 154,50)];
    [Male setImage:[UIImage imageNamed: @"male.png"] forState:UIControlStateNormal];
    [Male addTarget: self action: @selector(onMaleSelection) forControlEvents:UIControlEventTouchUpInside ];
    [self.view addSubview:Male];
    
    UIButton* Female = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth/2-154/2, screenHeight/3 + 100, 154, 50)];
    [Female setImage:[UIImage imageNamed: @"female.png"] forState:UIControlStateNormal];
    [Female addTarget: self action: @selector(onFemaleSelection) forControlEvents: UIControlEventTouchUpInside ];
    [self.view addSubview:Female];

}
-(void)onMaleSelection
{
    isMale = true;
    [self BlowScreen];
   // [self BlowScreenPage];
}
-(void)onFemaleSelection
{
    isMale = false;
     [self BlowScreen];
    //[self BlowScreenPage];
}
-(void)DisableSelectionPage
{
    [self DisableLandingPage];
}
-(void)shareFB
{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeFacebook];
        [tweetSheet setInitialText:@"This is hilarious check my breath result and try for urself"];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
    else
    {
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
        {
            SLComposeViewController *tweetSheet = [SLComposeViewController
                                                   composeViewControllerForServiceType:SLServiceTypeFacebook];
            [tweetSheet setInitialText:@"This is hilarious check my breath result and try for urself"];
            [self presentViewController:tweetSheet animated:YES completion:nil];
        }
    }
  }

-(void)shareTwitter
{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:@"This is hilarious check my breath result and try for urself"];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
    else
    {
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
        {
            SLComposeViewController *tweetSheet = [SLComposeViewController
                                                   composeViewControllerForServiceType:SLServiceTypeTwitter];
            [tweetSheet setInitialText:@"This is hilarious check my breath result and try for urself"];
            [self presentViewController:tweetSheet animated:YES completion:nil];
        }
    }
}


-(void)BlowScreenPage
{
    [self DisableSelectionPage];
    isAnimationMint = false;
    UIImage *image = [UIImage imageNamed: @"BadTest-5.png"];
    imgView1 = [[UIImageView alloc] initWithImage:image];
    imgView1.backgroundColor = [UIColor blackColor];
    imgView1.frame = CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height);
    //[self.view addSubview:imgView1];
    //[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(CountDown) userInfo:nil repeats:YES];
}
-(void)CountDown
{
    if(i == 0)
    {
        i--;
        [myTimer invalidate];
        [self Result];
    }
    if(i == 3)
    {
       myTimer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(CountDown) userInfo:nil repeats:YES];
    }
    if(i < 1)
    {
        //[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(CountDown) object:nil];
        //[myTimer stop];
        return;
    }
    [self DisableLandingPage];
    isAnimationMint = false;
    NSString* temp = @"cn " ;
    Beep.currentTime = 0;
    [Beep play];
    temp = [temp  stringByAppendingString:[NSString stringWithFormat:@"%d", i]];
    UIImage *image = [UIImage imageNamed: temp];
    imgView1 = [[UIImageView alloc] initWithImage:image];
    imgView1.backgroundColor = [UIColor blackColor];
    imgView1.frame = CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height);
    [self.view addSubview:imgView1];
    i--;
}


- (void) showBanner
{
   /* [RevMobAds startSessionWithAppID:@"533ee27c23baf02027159df1"];
    
    if(YES)
    {
        revBannerView = [[RevMobAds session] bannerView];
        [revBannerView loadAd];
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        CGFloat screenWidth = screenRect.size.width;
        CGFloat screenHeight = screenRect.size.height;
        revBannerView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
        [self.view addSubview: revBannerView];
        
    }*/
}

- (void) hideBanner{
   /* if(YES){
        if(revBannerView)
            [revBannerView removeFromSuperview];
        revBannerView = Nil;
    }*/
}

-(void)Result
{
    Score = 0;
    [self DisableLandingPage];
    NSString* filename;
    UIImage *image;
    int fromNumber = 1;
    int toNumber = 7;
    index = (arc4random()%(toNumber-fromNumber))+fromNumber;
    NSLog(@"Index Value is : %i",index);
    if(isMale)
    {
        filename = @"male_";
        filename = [filename  stringByAppendingString:[NSString stringWithFormat:@"%d", index]];
    }
    else
    {
        filename = @"female_";
        filename = [filename  stringByAppendingString:[NSString stringWithFormat:@"%d", index]];
    }
    if(index == 1 || index == 2)
    {
        PositiveAudioPlayer.currentTime = 0;
        [PositiveAudioPlayer play];
    }
    else
    {
        NegativeAudioPlayer.currentTime = 0;
        [NegativeAudioPlayer play];
    }
    
    isAnimationMint = false;
    image = [UIImage imageNamed: filename];
    imgView1 = [[UIImageView alloc] initWithImage:image];
    imgView1.backgroundColor = [UIColor blackColor];
    imgView1.frame = CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height);
    [self.view addSubview:imgView1];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;

    UIButton* BackBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, screenHeight - screenHeight/10, 100, 45)];
    [BackBtn setImage:[UIImage imageNamed: @"BackButton_New.png"] forState:UIControlStateNormal];
    [BackBtn addTarget: self action: @selector(StartGame) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:BackBtn];
 
    volumnMute = [[UIButton alloc] initWithFrame:CGRectMake(100, screenHeight - screenHeight/10, 60, 45)];
    [volumnMute setImage:[UIImage imageNamed: @"btn_musicon.png"] forState:UIControlStateNormal];
    [volumnMute addTarget: self action: @selector(VolumnButtonClicked) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:volumnMute];

    UIButton* twittor = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth - 70, screenHeight - screenHeight/10, 40, 36)];
    [twittor setImage:[UIImage imageNamed: @"TwitterIcon.png"] forState:UIControlStateNormal];
    [twittor addTarget: self action: @selector(shareTwitter) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:twittor];

    UIButton* facebook = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth - 70  - 60, screenHeight - screenHeight/10, 40, 36)];
    [facebook setImage:[UIImage imageNamed: @"fb.png"] forState:UIControlStateNormal];
    [facebook addTarget: self action: @selector(shareFB) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:facebook];

}
-(void) StartGame
{
    [self showBanner];
    i = 3;
    [self LoadLandingPage];
}
-(void) VolumnButtonClicked
{
    isMusicOn = !isMusicOn;
    if(isMusicOn)
        [volumnMute setImage:[UIImage imageNamed: @"btn_musicon.png"] forState:UIControlStateNormal];
    else
         [volumnMute setImage:[UIImage imageNamed: @"btn_musicoff.png"] forState:UIControlStateNormal];
    if(!isMusicOn)
    {
        if(index == 1 || index == 2)
            PositiveAudioPlayer.volume = 0.0F;
        else
            NegativeAudioPlayer.volume = 0.0F;
    
    }
    else
    {
        if(index == 1 || index == 2)
            PositiveAudioPlayer.volume = 1.0F;
        else
            NegativeAudioPlayer.volume = 1.0F;
    }
}
-(void)PopAIP
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:
                              @"" message:@"Buy 20 mint for just $0.99" delegate:self
                                             cancelButtonTitle:@"Cancel" otherButtonTitles:@"Buy", nil];
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            NSLog(@"Cancel button clicked");
            break;
        case 1:
            [[MKStoreManager sharedManager] buyFeatureG];
            
            //[self MintMiniLaunch];
            break;
            
        default:
            break;
    }
}
-(void)MintMiniLaunch
{
    Chance = 0;
    [self DisableSelectionPage];
    isAnimationMint = true;
    UIImage *MiniMintBackGround = [UIImage imageNamed: @"MiniMint_Image.png"];
    imgView1 = [[UIImageView alloc] initWithImage:MiniMintBackGround];
    imgView1.backgroundColor = [UIColor blackColor];
    imgView1.frame = CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height);
    [self.view addSubview:imgView1];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;

     
    Mint = [UIImage imageNamed: @"Mint1.png"];
    imgView1 = [[UIImageView alloc] initWithImage:Mint];
    imgView1.backgroundColor = [UIColor blackColor];
    imgView1.frame = CGRectMake(screenWidth/2, screenHeight - screenHeight/6, 20,20);
    [self.view addSubview:imgView1];

 
}
-(void)ScoreScreen
{
    [self DisableSelectionPage];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenHeight = screenRect.size.height;
 
    CGRect labelFrame = CGRectMake( 10, 250, 200, 90 );
    UILabel* label = [[UILabel alloc] initWithFrame: labelFrame];
    [label setText: @"Your Score is :"];
    [label setFont: [UIFont systemFontOfSize:28.0f]];
    [label setTextColor: [UIColor orangeColor]];
    [self.view addSubview: label];

    CGRect ScoreFrame = CGRectMake( 210, 250, 60, 90 );
    UILabel* ScoreDisplay = [[UILabel alloc] initWithFrame: ScoreFrame];
    [ScoreDisplay setText: [NSString stringWithFormat:@"%d",Score]];
    [ScoreDisplay setFont: [UIFont systemFontOfSize:28.0f]];
    [ScoreDisplay setTextColor: [UIColor orangeColor]];
    [self.view addSubview: ScoreDisplay];

    
    UIButton* Back = [[UIButton alloc] initWithFrame:CGRectMake(25, screenHeight - screenHeight/9, 70,50)];
    [Back setImage:[UIImage imageNamed: @"red-back-arrow-md.png"] forState:UIControlStateNormal];
    [Back addTarget: self action: @selector(onBackButton) forControlEvents:UIControlEventTouchUpInside ];
    [self.view addSubview:Back];

}
-(void)onBackButton
{
    [self DisableSelectionPage];
    [self LoadLandingPage];
}
- (void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    
    if(!isAnimationMint) return;
    if(Chance > 20)
    {
        [self ScoreScreen];
    }
    Chance++;
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationPaced;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = YES;
    
    UITouch *touch = [touches anyObject];
  //  CGRect screenBounds = [[UIScreen mainScreen] bounds];
    // Get the specific point that was touched
    CGPoint point = [touch locationInView:self.view];
    if(point.x > 80 && point.x < 150 && point.y > 240 && point.y < 300)
        Score = Score+1;
    CGPoint endPoint = CGPointMake(point.x, point.y);
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL, 140, 460);
    CGPathAddCurveToPoint(curvedPath, NULL, endPoint.x, 140, endPoint.x, 460 , endPoint.x, endPoint.y);
    pathAnimation.path = curvedPath;
    CGPathRelease(curvedPath);
    
    [imgView1.layer addAnimation:pathAnimation forKey:@"curveAnimation"];

}


-(void)BlowScreen
{
    [self DisableLandingPage];
    UIImage *image = [UIImage imageNamed: @"bg.png"];
    imgView1 = [[UIImageView alloc] initWithImage:image];
    imgView1.backgroundColor = [UIColor blackColor];
    imgView1.frame = CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height);
    [self.view addSubview:imgView1];
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(CountDown) userInfo:nil repeats:NO];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
