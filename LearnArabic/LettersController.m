//
//  ViewController.m
//  LearnArabic
//
//  Created by Mehsam Saeed on 19/01/2018.
//  Copyright © 2018 Mehsam Saeed. All rights reserved.
//

#import "LettersController.h"
#import "Constant.h"
#import "GoogleMobileAds/GoogleMobileAds.h"


@interface LettersController (){
    NSTimer* firworkTimer;
    int fireworkCounter;
    NSString* imagName;
     GADMasterViewController* shared;
    CGRect intialFrame;
    float chnageInSize,changeInOrigin;
    BOOL flagForViewWillAppear;
    BOOL isAnimating;
}
@property (nonatomic, strong) NSDictionary *soundFileDictionary;
@end
static NSInteger clickCount = 0;
@implementation LettersController{
 AVAudioPlayer *audioPlayer;
    NSString* fileName;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    fileName=@"bkgSound";
    changeInOrigin=5;
    chnageInSize=10;
    isAnimating = NO;
    self.soundFileDictionary = @{
            @1: @"alif", @2: @"baa", @3: @"taa", @4: @"saa",
            @5: @"jeem", @6: @"ha", @7: @"kha", @8: @"daal",
            @9: @"zaal", @10: @"raa", @11: @"zaa", @12: @"seen",
            @13: @"sheen", @14: @"sad", @15: @"zad", @16: @"toa",
            @17: @"zoa", @18: @"aeen", @19: @"ghayn", @20: @"faa",
            @21: @"kaaf", @22: @"kaaf", @23: @"laam", @24: @"meem",
            @25: @"nun", @26: @"ha", @27: @"waw", @28: @"ya"
        };
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
- (IBAction)playSound:(UIButton *)sender {
    
    
    if (isAnimating) return; // Exit if animation is in progress
        
        // Get the sound file name based on the tag
        NSString *fileName = self.soundFileDictionary[@(sender.tag)];
        if (fileName) {
            [self playSoundFile:fileName];
            [self animateButton:sender];
        }

}

- (void)animateButton:(UIButton *)button {
    isAnimating = YES; // Lock further animations until this one finishes
    intialFrame=button.frame;
    [UIView animateWithDuration:0.6 animations:^{
            button.frame = CGRectMake(
                                      self->intialFrame.origin.x + self->changeInOrigin,
                                      self->intialFrame.origin.y + self->changeInOrigin,
                                      self->intialFrame.size.width - self->chnageInSize,
                                      self->intialFrame.size.height - self->chnageInSize
            );
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.6 animations:^{
                button.frame = self->intialFrame;
            } completion:^(BOOL finished) {
                self->isAnimating = NO; // Unlock animations
            }];
        }];
}


-(void)playSoundFile:(NSString*)fileNmae{
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:fileNmae
                                         ofType:@"mp3"]];
    
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc]
                   initWithContentsOfURL:url
                   error:&error];
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        audioPlayer.delegate = self;
        [audioPlayer prepareToPlay];
        [audioPlayer play];
    }
    
}


-(void)changeFireWorkImage{
    
    if (fireworkCounter==22) {
        fireworkCounter=1;
    }

    
    
    NSString* imageName=[NSString stringWithFormat:@"%@%i.png",@"star_000",fireworkCounter];
    [self.animationIV setImage:[UIImage imageNamed:imageName]];
    
    fireworkCounter++;
}
-(void)playFireWorkAnimation{
    firworkTimer=[NSTimer scheduledTimerWithTimeInterval:0.07 target:self selector:@selector(changeFireWorkImage) userInfo:nil repeats:YES];
}
- (IBAction)homeButtonTapped:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark- Load and Show Delegate

- (void)loadVideoAd {
    [UnityAds load:@"video" loadDelegate:self];
}

- (void)showVideoAd {
    [UnityAds show:self placementId:@"video" showDelegate: self];
}

- (void)unityAdsAdLoaded:(NSString *)placementId{
    NSLog(@"Ad loaded for Ad Unit or Placement: %@", placementId);
    
}
- (void)unityAdsAdFailedToLoad:(NSString *)placementId
                     withError:(UnityAdsLoadError)error
                   withMessage:(NSString *)message{
    [self loadVideoAd];
}
- (void)unityAdsShowFailed:(NSString *)placementId
                 withError:(UnityAdsShowError)error
               withMessage:(NSString *)message{
    
}
- (void)unityAdsShowStart:(NSString *)placementId{
    
}
- (void)unityAdsShowClick:(NSString *)placementId{
    
}
- (void)unityAdsShowComplete:(NSString *)placementId
             withFinishState:(UnityAdsShowCompletionState)state{
    
    [self loadVideoAd];
}

@end
