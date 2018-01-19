//
//  HomeControllerViewController.h
//  LearnArabic
//
//  Created by Mehsam Saeed on 16/04/2018.
//  Copyright © 2018 Mehsam Saeed. All rights reserved.
//

#import <UIKit/UIKit.h>
@import UnityAds;
@interface HomeControllerViewController : UIViewController<UnityAdsInitializationDelegate,UnityAdsDelegate>
@property (weak, nonatomic) IBOutlet UIButton *lettersIV;
@property (weak, nonatomic) IBOutlet UIButton *lettersAndPicturesIV;
@property (weak, nonatomic) IBOutlet UIButton *letterTracingButton;
@property (weak, nonatomic) IBOutlet UIButton *pictureRecognitionButton;
- (IBAction)buttonTapped:(id)sender;

@end
