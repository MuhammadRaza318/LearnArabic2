//
//  LettersAndPictureController.m
//  LearnArabic
//
//  Created by Mehsam Saeed on 16/04/2018.
//  Copyright © 2018 Mehsam Saeed. All rights reserved.
//

#import "LettersAndPictureController.h"
#import "Constant.h"
#import "CNPPopupController.h"

@interface LettersAndPictureController ()<CNPPopupControllerDelegate>{
    NSMutableArray* dataArray;;
    NSInteger arrayCounter;
    GADMasterViewController* shared;
    CGRect intialFrame;
       float chnageInSize,changeInOrigin;

}
@property (nonatomic, strong) CNPPopupController *popupController;
@end

@implementation LettersAndPictureController

- (void)viewDidLoad {
    [super viewDidLoad];
    dataArray=[[NSMutableArray alloc] init];
    arrayCounter=1;
//    [self loadVideoAd];
    [self setUpDataArray];
//    shared=[GADMasterViewController singleton];
    changeInOrigin=20;
   
    intialFrame=self.baloonV.frame;
    [self setImageForIndex:1];
}
-(void)viewDidAppear:(BOOL)animated{
     [shared resetAdView:self];
   
}
-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUpDataArray{
   
    dataArray=[[NSMutableArray alloc] init];
    for (int i=1; i<=28; i++) {
        NSString* imageName1=[NSString stringWithFormat:@"latterAndPictureImg-%i%@",i,@".png"];
        NSString* imageName2=[NSString stringWithFormat:@"letterAndPictureLetter-%i%@",i,@".png"];
 NSMutableDictionary* dic=[[NSMutableDictionary alloc] init];
        [dic setObject:imageName1 forKey:letterAndPictureImgKey];
        [dic setObject:imageName2 forKey:letterAndPictureLetterKey];
        [dataArray addObject:dic];
    }
  
}


- (IBAction)menueButtonTapped:(id)sender {
     [self showPopupWithStyle:CNPPopupStyleCentered];
    // [self showPopupWithStyle:CNPPopupStyleActionSheet];
//     [self showPopupWithStyle:CNPPopupStyleFullscreen];
}
- (IBAction)homeButtonTepped:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)forwardButtonTapped:(id)sender {
    if ([sender tag]==1 && arrayCounter<28) {
         
//        if([shared ShouldShowVideoAd]){
//            [self showVideoAd];
//        }
        arrayCounter++;
    }
    else if([sender tag]==0 && arrayCounter>1)
    {
//        if([shared ShouldShowVideoAd]){
//            [self showVideoAd];
//        }
        arrayCounter--;
    }
    
   
    [self setImageForIndex:arrayCounter];
}
-(void)setImageForIndex:(NSInteger)index{
    NSDictionary* dic=[[NSDictionary alloc]init];
    dic=dataArray[index-1];
    NSLog(@"%@", [dic objectForKey:letterAndPictureImgKey]);
    NSLog(@"%@", [dic objectForKey:letterAndPictureLetterKey]);
    __PictureIV.image=[UIImage imageNamed:[dic objectForKey:letterAndPictureImgKey]];
      _letterIV.image=[UIImage imageNamed:[dic objectForKey:letterAndPictureLetterKey]];
    _baloonV.frame=intialFrame;
    [self startBaloonAnimation];
}

- (void)showPopupWithStyle:(CNPPopupStyle)popupStyle {

    self.popupController = [[CNPPopupController alloc] initWithContents:@[_keyBoardV]];
    self.popupController.theme = [CNPPopupTheme defaultTheme];
    self.popupController.theme.backgroundColor=[UIColor clearColor];
    self.popupController.theme.popupStyle = popupStyle;
    self.popupController.delegate = self;
    self.popupController.theme.animationDuration=0.5;
    [self.popupController presentPopupControllerAnimated:YES];
}

- (IBAction)alphabitsButtonTapped:(UIButton*)sender {
    [self setImageForIndex:[sender tag]];
    [self.popupController dismissPopupControllerAnimated:YES];
}

-(void)startBaloonAnimation{
    [UIView animateWithDuration:(NSTimeInterval)1 animations:^{
       
        self->_baloonV.frame=CGRectMake(self->intialFrame.origin.x,self->intialFrame.origin.y-self->changeInOrigin,self->intialFrame.size.width,self->intialFrame.size.height);
        
    } completion:^(BOOL finished) {
        
    }];
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
