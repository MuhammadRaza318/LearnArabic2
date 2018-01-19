//
//  LettersAndPictureController.h
//  LearnArabic
//
//  Created by Mehsam Saeed on 16/04/2018.
//  Copyright © 2018 Mehsam Saeed. All rights reserved.
//

#import <UIKit/UIKit.h>
@import UnityAds;
@interface LettersAndPictureController : UIViewController<UnityAdsLoadDelegate, UnityAdsShowDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *_PictureIV;
@property (weak, nonatomic) IBOutlet UIImageView *letterIV;
- (IBAction)homeButtonTepped:(id)sender;
- (IBAction)forwardButtonTapped:(id)sender;

- (IBAction)menueButtonTapped:(id)sender;
- (IBAction)alphabitsButtonTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *keyBoardV;
@property (weak, nonatomic) IBOutlet UIView *baloonV;



@end
