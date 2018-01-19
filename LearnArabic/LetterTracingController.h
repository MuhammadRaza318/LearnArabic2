//
//  LetterTracingController.h
//  LearnArabic
//
//  Created by Mehsam Saeed on 24/01/2018.
//  Copyright © 2018 Mehsam Saeed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDScratchImageView.h"
#import "CNPPopupController.h"
@import UnityAds;
@interface LetterTracingController : UIViewController<MDScratchImageViewDelegate,CNPPopupControllerDelegate,UnityAdsLoadDelegate, UnityAdsShowDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *baseImageView;


@property (weak, nonatomic) IBOutlet UIView *keyBoardV;
@property (weak, nonatomic) IBOutlet MDScratchImageView *scratchIV;
- (IBAction)forwardButtonTapped:(id)sender;
- (IBAction)menueButtonTapped:(id)sender;
- (IBAction)homeButtontapped:(id)sender;
- (IBAction)eraseButtonTapped:(id)sender;
- (IBAction)changeColorButtonTapped:(id)sender;
- (IBAction)alphabitsButtonTapped:(id)sender;

@end
