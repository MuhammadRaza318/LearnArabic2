//
//  GADMasterViewController.m
//  FakeInvoiceGenrator
//
//  Created by Mehsam Saeed on 11/01/2018.
//  Copyright © 2018 Mehsam Saeed. All rights reserved.
//

#import "GADMasterViewController.h"
#import "Constant.h"
#import "GADMasterViewController.h"
@interface GADMasterViewController (){
    UIViewController* interstitialRootViewController;
}

@end

@implementation GADMasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(GADMasterViewController *)singleton {
    static dispatch_once_t pred;
    static GADMasterViewController *shared;
    // Will only be run once, the first time this is called
    dispatch_once(&pred, ^{
        shared = [[GADMasterViewController alloc] init];
    });
    return shared;
    
}
-(id)init {
    if (self = [super init]) {
        adBanner_ = [[GADBannerView alloc]
                     initWithFrame:CGRectMake(0,self.view.frame.size.height-50,self.view.frame.size.width,50)];
//        adBanner_ = [[GADBannerView alloc]
//                     initWithFrame:CGRectMake(0,0,50,self.view.frame.size.height)];
        // Has an ad request already been made
        isLoaded_ = NO;
    }
    return self;
}
-(void)resetAdView:(UIViewController *)rootViewController {
    // Always keep track of currentDelegate for notification forwarding
    currentDelegate_ = rootViewController;
    
    // Ad already requested, simply add it into the view
    if (isLoaded_) {
        [rootViewController.view addSubview:adBanner_];
    } else {
        
        adBanner_.delegate = self;
        adBanner_.rootViewController = rootViewController;
        adBanner_.adUnitID = bannerID;
        
        GADRequest *request = [GADRequest request];
        [adBanner_ loadRequest:request];
        [rootViewController.view addSubview:adBanner_];
        isLoaded_ = YES;
    }
}
-(BOOL)ShouldShowVideoAd{
     NSInteger counter=[[[NSUserDefaults standardUserDefaults] objectForKey:@"interstialcounter"] integerValue];
    NSLog(@"counter: %ld", (long)counter);
    if (counter>=5) {
        interstitialCounter = 0;
        [[NSUserDefaults standardUserDefaults] setInteger:interstitialCounter forKey:@"interstialcounter"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        return true;
//        addInterstitial=[[GADInterstitial alloc] initWithAdUnitID:interstitialID];
//        addInterstitial.delegate=self;
//        [addInterstitial presentFromRootViewController:rootViewController];
//        GADRequest* request=[GADRequest request];
//        [addInterstitial loadRequest:request];
//        interstitialRootViewController=rootViewController;
    }
    else{
        interstitialCounter++;
        [[NSUserDefaults standardUserDefaults] setInteger:interstitialCounter forKey:@"interstialcounter"];
         [[NSUserDefaults standardUserDefaults]synchronize];
        return false;
    }
   
    
}
//-(void)interstitialDidReceiveAd:(GADInterstitial *)ad{
//    interstitialCounter=0;
//    [addInterstitial presentFromRootViewController:interstitialRootViewController];
//
//}
//-(void)interstitial:(GADInterstitial *)ad didFailToReceiveAdWithError:(GADRequestError *)error{
//  //  [self loadIntersitioal];
//    NSLog(@"failed to present");
//}
@end
