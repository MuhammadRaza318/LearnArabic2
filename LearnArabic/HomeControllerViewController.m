//
//  HomeControllerViewController.m
//  LearnArabic
//
//  Created by Mehsam Saeed on 16/04/2018.
//  Copyright © 2018 Mehsam Saeed. All rights reserved.
//

#import "HomeControllerViewController.h"
#import "Constant.h"
#import "PurchaseViewController.h"
@interface HomeControllerViewController (){
    GADMasterViewController* shared;
    CGRect intialFrame;
    CGPoint rootPoint,startPoint,endPoint,touchOffset;
}

@end

@implementation HomeControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    shared=[GADMasterViewController singleton];
//    [shared resetAdView:self];
//    [UnityAds initialize:UnityAdsID testMode:true initializationDelegate:self];
//    [UnityAds addDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)buttonTapped:(id)sender {
    intialFrame=[sender frame];
    [UIView animateWithDuration:1 animations:^{
        [sender setFrame:CGRectMake(self->intialFrame.origin.x+10,self->intialFrame.origin.y+10,self->intialFrame.size.width-20  ,self->intialFrame.size.height-20)];
    } completion:^(BOOL finished) {
        double delayInSeconds = 0.1;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
           
            if ([sender tag]==1) {
                [self performSegueWithIdentifier:@"LettersController" sender:self];
                
            }
            
            else if([sender tag]==2){
                if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isProUser"]) {
                       [self performSegueWithIdentifier:@"LettersAndPictureController" sender:self];
                   } else {
                       PurchaseViewController *purchaseVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PurchaseViewController"];
                          [self.navigationController pushViewController:purchaseVC animated:YES];
                   }
            }
            
            else if([sender tag]==3){
                if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isProUser"]) {
                    [self performSegueWithIdentifier:@"LetterTracingController" sender:self];
                   } else {
                       PurchaseViewController *purchaseVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PurchaseViewController"];
                          [self.navigationController pushViewController:purchaseVC animated:YES];
                   }
            }
            else if([sender tag]==4){
                if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isProUser"]) {
                    [self performSegueWithIdentifier:@"PictureRecognition" sender:self];
                   } else {
                       PurchaseViewController *purchaseVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PurchaseViewController"];
                          [self.navigationController pushViewController:purchaseVC animated:YES];
                   }
            }
        });
        
        [UIView animateWithDuration:1 animations:^{
            [sender setFrame:self->intialFrame];
                }];
        
    }];
}
#pragma mark- Initialization Delegate
- (void)initializationComplete {
    // Perform logic for ads initialization succeeded.
}

- (void)initializationFailed:(UnityAdsInitializationError)error withMessage:(NSString *)message {
    // Perform logic for ads initialization failed.
}

// Implement the ads listener callback methods:
- (void)unityAdsReady:(NSString *)placementId {
    // Perform logic for ads being available to show.
//    if ([placementId  isEqual: @"video"]) {
//        NSLog(@"Ad ready for Ad Placement: %@", placementId);
//        [self showVideoAd];
//    }
}

- (void)unityAdsDidStart:(NSString *)placementId {
    // Perform logic for a user starting an ad.
}

- (void)unityAdsDidFinish:(NSString *)placementId
withFinishState:(UnityAdsFinishState)state {
    // Perform logic for a user finishing an ad.
}

- (void)unityAdsDidError:(UnityAdsError)error withMessage:(NSString *)message {
    // Perform logic for a Unity Ads service error.
}
@end
