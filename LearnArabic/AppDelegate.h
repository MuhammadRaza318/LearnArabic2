//
//  AppDelegate.h
//  LearnArabic
//
//  Created by Mehsam Saeed on 19/01/2018.
//  Copyright © 2018 Mehsam Saeed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate , SKProductsRequestDelegate>
@property (strong, nonatomic) SKProduct *product;
@property (strong, nonatomic) UIWindow *window;
@end

