//
//  GADMasterViewController.h
//  FakeInvoiceGenrator
//
//  Created by Mehsam Saeed on 11/01/2018.
//  Copyright © 2018 Mehsam Saeed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMobileAds/GoogleMobileAds.h>

@interface GADMasterViewController : UIViewController<GADBannerViewDelegate>{
    GADBannerView *adBanner_;
//    GADInterstitialAd* addInterstitial;
    BOOL didCloseWebsiteView_;
    BOOL isLoaded_;
    id currentDelegate_;
    NSInteger interstitialCounter;
}
+(GADMasterViewController *)singleton ;

-(void)resetAdView:(UIViewController *)rootViewController ;
-(BOOL)ShouldShowVideoAd;
@end
