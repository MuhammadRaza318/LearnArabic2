//
//  PictureRecognition.h
//  LearnArabic
//
//  Created by Mehsam Saeed on 17/04/2018.
//  Copyright © 2018 Mehsam Saeed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@import UnityAds;
@interface PictureRecognition : UIViewController<AVAudioPlayerDelegate,AVSpeechSynthesizerDelegate,UnityAdsLoadDelegate, UnityAdsShowDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *letterIV;
@property (weak, nonatomic) IBOutlet UIImageView *iv1;
@property (weak, nonatomic) IBOutlet UIImageView *iv2;
@property (weak, nonatomic) IBOutlet UIImageView *iv3;
- (IBAction)homeButtonTepped:(id)sender;
- (IBAction)forwardButtonTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *forwardButton;
@property (weak, nonatomic) IBOutlet UIImageView *firework1;
@property (weak, nonatomic) IBOutlet UIImageView *firework2;

@property (strong, nonatomic) AVSpeechSynthesizer *synthesizer;
@end
