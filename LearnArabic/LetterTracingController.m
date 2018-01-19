//
//  LetterTracingController.m
//  LearnArabic
//
//  Created by Mehsam Saeed on 24/01/2018.
//  Copyright © 2018 Mehsam Saeed. All rights reserved.
//

#import "LetterTracingController.h"
#import "Constant.h"


#define kActionSheetColor       100
#define kActionSheetTool        101

@interface LetterTracingController (){
    NSMutableArray* dataArray;
    NSInteger arrayCounter;
    UIColor* selectedColor;
    GADMasterViewController* shared;
}
@property (nonatomic, strong) CNPPopupController *popupController;

@end

@implementation LetterTracingController

- (void)viewDidLoad {
    [super viewDidLoad];
  
  
    _scratchIV.frame=CGRectMake(0,0,self.view.frame.size.width/3.7075,self.view.frame.size.width/4.4466);
    _scratchIV.center=self.view.center;
    
    _baseImageView.frame=CGRectMake(0,0,self.view.frame.size.width/3.7075,self.view.frame.size.width/4.4466);
    _baseImageView.center=self.view.center;
    
    _scratchIV.delegate=self;
   
     [_scratchIV setImage:[UIImage imageNamed:@"LetterTracing-1-1.png"] radius:1];
    arrayCounter=1;
    [self setUpDataArray];
    selectedColor=[UIColor greenColor];
    
  //  shared=[GADMasterViewController singleton];
  //  [shared resetAdView:self];
//    [self loadVideoAd];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUpDataArray{
    
    dataArray=[[NSMutableArray alloc] init];
    for (int i=1; i<=28; i++) {
        NSString* imageName1=[NSString stringWithFormat:@"LetterTracing-%i-%@%@",i,@"1",@".png"];
        NSString* imageName2=[NSString stringWithFormat:@"LetterTracing-%i-%@%@",i,@"2",@".png"];
        NSMutableDictionary* dic=[[NSMutableDictionary alloc] init];
        [dic setObject:imageName1 forKey:letterTracingScratchKey];
        [dic setObject:imageName2 forKey:letterTracingBaseImgKey];
        [dataArray addObject:dic];
    }
    [self setImageForIndex:1];
}

-(void)setImageForIndex:(NSInteger)index{
    NSDictionary* dic=[[NSDictionary alloc]init];
    dic=dataArray[index-1];
    _baseImageView.image=[UIImage imageNamed:[dic objectForKey:letterTracingBaseImgKey]];
    [_scratchIV setImage:[UIImage imageNamed:[dic objectForKey:letterTracingScratchKey]] radius:20];

    
}

#pragma mark - MDScratchImageViewDelegate

- (void)mdScratchImageView:(MDScratchImageView *)scratchImageView didChangeMaskingProgress:(CGFloat)maskingProgress {
    NSLog(@"%s %p progress == %.2f", __PRETTY_FUNCTION__, scratchImageView, maskingProgress);
}


- (IBAction)forwardButtonTapped:(UIButton*)sender {
   
       
        if ([sender tag]==1 && arrayCounter<28) {
             arrayCounter++;
            
//            if([shared ShouldShowVideoAd]){
//                [self showVideoAd];
//            }
        }
        else if([sender tag]==0 && arrayCounter>1)
        {
            arrayCounter--;
            
//            if([shared ShouldShowVideoAd]){
//                [self showVideoAd];
//            }
        }
         [self setImageForIndex:arrayCounter];
   
    
   
}


- (IBAction)menueButtonTapped:(id)sender {
    //[self showPopupWithStyle:CNPPopupStyleActionSheet];
    [self showPopupWithStyle:CNPPopupStyleCentered];

}

- (IBAction)homeButtontapped:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)eraseButtonTapped:(id)sender {
    [self setImageForIndex:arrayCounter];
}

- (IBAction)changeColorButtonTapped:(UIButton*)sender {
    if ([sender tag]==1) {
        selectedColor=[UIColor redColor];
    }
    else if ([sender tag]==2){
         selectedColor=[UIColor blueColor];
    }
    else if ([sender tag]==3){
         selectedColor=[UIColor greenColor];
    }
    _baseImageView.backgroundColor=selectedColor;
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
