//
//  ViewController.h
//  LearnArabic
//
//  Created by Mehsam Saeed on 19/01/2018.
//  Copyright © 2018 Mehsam Saeed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "GoogleMobileAds/GoogleMobileAds.h"
@import UnityAds;
@interface LettersController : UIViewController<AVAudioPlayerDelegate, UnityAdsLoadDelegate, UnityAdsShowDelegate , GADBannerViewDelegate,GADFullScreenContentDelegate>

- (IBAction)playSound:(id)sender;
@property(nonatomic,strong)GADInterstitialAd* interstitial;
@property (weak, nonatomic) IBOutlet UIImageView *animationIV;
- (IBAction)homeButtonTapped:(id)sender;
-(void)playSoundFile:(NSString*)fileNmae;
@end

