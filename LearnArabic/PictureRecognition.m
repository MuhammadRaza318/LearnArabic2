//
//  PictureRecognition.m
//  LearnArabic
//
//  Created by Mehsam Saeed on 17/04/2018.
//  Copyright © 2018 Mehsam Saeed. All rights reserved.
//

#import "PictureRecognition.h"
#import "Constant.h"
#import "LettersController.h"
@interface PictureRecognition (){
    NSMutableArray* dataArray,*uniqueOptionArray;
    NSInteger arrayCounter;
    AVAudioPlayer *audioPlayer;
    
    CGRect intialFrame;
    CGPoint rootPoint,startPoint,endPoint,touchOffset;
    int fireworkCounter1,fireworkCounter2;
    NSTimer* firworkTimer;
    
      GADMasterViewController* shared;
    
}

@end

@implementation PictureRecognition

- (void)viewDidLoad {
    [super viewDidLoad];
    self.synthesizer = [[AVSpeechSynthesizer alloc] init];
    self.synthesizer.delegate=self;
    dataArray=[[NSMutableArray alloc] init];
    
    UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneTap:)];
    UITapGestureRecognizer *singleTap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneTap:)];
    UITapGestureRecognizer *singleTap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneTap:)];
    
    [_iv1 addGestureRecognizer:singleTap1];
    [_iv2 addGestureRecognizer:singleTap2];
    [_iv3 addGestureRecognizer:singleTap3];
    [self setUpArray];
    arrayCounter=1;
    fireworkCounter1=1;
    fireworkCounter2=15;
    //[self createQuestion];
    [self setImageForIndex:arrayCounter];
    
  //  shared=[GADMasterViewController singleton];
  //  [shared resetAdView:self];
//    [self loadVideoAd];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUpArray{
    
    dataArray=[[NSMutableArray alloc] init];
    
    NSMutableDictionary *questionDic1=[[NSMutableDictionary alloc] init];
    NSMutableDictionary *questionDic2=[[NSMutableDictionary alloc] init];
    NSMutableDictionary *questionDic3=[[NSMutableDictionary alloc] init];
    NSMutableDictionary *questionDic4=[[NSMutableDictionary alloc] init];
    NSMutableDictionary *questionDic5=[[NSMutableDictionary alloc] init];
    NSMutableDictionary *questionDic6=[[NSMutableDictionary alloc] init];
    NSMutableDictionary *questionDic7=[[NSMutableDictionary alloc] init];
    NSMutableDictionary *questionDic8=[[NSMutableDictionary alloc] init];
    NSMutableDictionary *questionDic9=[[NSMutableDictionary alloc] init];
    NSMutableDictionary *questionDic10=[[NSMutableDictionary alloc] init];
    NSMutableDictionary *questionDic11=[[NSMutableDictionary alloc] init];
    NSMutableDictionary *questionDic12=[[NSMutableDictionary alloc] init];
    NSMutableDictionary *questionDic13=[[NSMutableDictionary alloc] init];
    NSMutableDictionary *questionDic14=[[NSMutableDictionary alloc] init];
    NSMutableDictionary *questionDic15=[[NSMutableDictionary alloc] init];
    
    NSMutableDictionary *questionDic16=[[NSMutableDictionary alloc] init];
    NSMutableDictionary *questionDic17=[[NSMutableDictionary alloc] init];
    NSMutableDictionary *questionDic18=[[NSMutableDictionary alloc] init];
    NSMutableDictionary *questionDic19=[[NSMutableDictionary alloc] init];
    NSMutableDictionary *questionDic20=[[NSMutableDictionary alloc] init];
    NSMutableDictionary *questionDic21=[[NSMutableDictionary alloc] init];
    NSMutableDictionary *questionDic22=[[NSMutableDictionary alloc] init];
    NSMutableDictionary *questionDic23=[[NSMutableDictionary alloc] init];
    NSMutableDictionary *questionDic24=[[NSMutableDictionary alloc] init];
    NSMutableDictionary *questionDic25=[[NSMutableDictionary alloc] init];
    NSMutableDictionary *questionDic26=[[NSMutableDictionary alloc] init];
    NSMutableDictionary *questionDic27=[[NSMutableDictionary alloc] init];
    NSMutableDictionary *questionDic28=[[NSMutableDictionary alloc] init];
    
    
    
    //Q1
    [questionDic1 setObject:@"PicRecognitionLetter-1.png" forKey:questionKey];
    [questionDic1 setObject:@"PicRecognitionImg-1.png" forKey:correctAnsKey];
    
    [questionDic1 setObject:@"PicRecognitionImg-1.png" forKey:option1Key];
    [questionDic1 setObject:@"PicRecognitionImg-9.png" forKey:option2Key];
    [questionDic1 setObject:@"PicRecognitionImg-5.png" forKey:option3Key];
    
    [dataArray addObject:questionDic1];
    
    //Q2
    [questionDic2 setObject:@"PicRecognitionLetter-2.png" forKey:questionKey];
    [questionDic2 setObject:@"PicRecognitionImg-2.png" forKey:correctAnsKey];
    
    [questionDic2 setObject:@"PicRecognitionImg-2.png" forKey:option1Key];
    [questionDic2 setObject:@"PicRecognitionImg-5.png" forKey:option2Key];
    [questionDic2 setObject:@"PicRecognitionImg-8.png" forKey:option3Key];
    
    [dataArray addObject:questionDic2];
    
    //Q3
    [questionDic3 setObject:@"PicRecognitionLetter-3.png" forKey:questionKey];
    [questionDic3 setObject:@"PicRecognitionImg-3.png" forKey:correctAnsKey];
    
    [questionDic3 setObject:@"PicRecognitionImg-3.png" forKey:option1Key];
    [questionDic3 setObject:@"PicRecognitionImg-7.png" forKey:option2Key];
    [questionDic3 setObject:@"PicRecognitionImg-20.png" forKey:option3Key];
    
    [dataArray addObject:questionDic3];
    
    //Q4
    [questionDic4 setObject:@"PicRecognitionLetter-4.png" forKey:questionKey];
    [questionDic4 setObject:@"PicRecognitionImg-4.png" forKey:correctAnsKey];
    
    [questionDic4 setObject:@"PicRecognitionImg-4.png" forKey:option1Key];
    [questionDic4 setObject:@"PicRecognitionImg-9.png" forKey:option2Key];
    [questionDic4 setObject:@"PicRecognitionImg-10.png" forKey:option3Key];
    
    [dataArray addObject:questionDic4];
    //Q5
    [questionDic5 setObject:@"PicRecognitionLetter-5.png" forKey:questionKey];
    [questionDic5 setObject:@"PicRecognitionImg-5.png" forKey:correctAnsKey];
    
    [questionDic5 setObject:@"PicRecognitionImg-5.png" forKey:option1Key];
    [questionDic5 setObject:@"PicRecognitionImg-15.png" forKey:option2Key];
    [questionDic5 setObject:@"PicRecognitionImg-23.png" forKey:option3Key];
    
    [dataArray addObject:questionDic5];
    //Q6
    [questionDic6 setObject:@"PicRecognitionLetter-6.png" forKey:questionKey];
    [questionDic6 setObject:@"PicRecognitionImg-6.png" forKey:correctAnsKey];
    
    [questionDic6 setObject:@"PicRecognitionImg-6.png" forKey:option1Key];
    [questionDic6 setObject:@"PicRecognitionImg-23.png" forKey:option2Key];
    [questionDic6 setObject:@"PicRecognitionImg-22.png" forKey:option3Key];
    
    [dataArray addObject:questionDic6];
    
    //Q7
    [questionDic7 setObject:@"PicRecognitionLetter-7.png" forKey:questionKey];
    [questionDic7 setObject:@"PicRecognitionImg-7.png" forKey:correctAnsKey];
    
    [questionDic7 setObject:@"PicRecognitionImg-7.png" forKey:option1Key];
    [questionDic7 setObject:@"PicRecognitionImg-11.png" forKey:option2Key];
    [questionDic7 setObject:@"PicRecognitionImg-24.png" forKey:option3Key];
    
    [dataArray addObject:questionDic7];
    
    //Q8
    [questionDic8 setObject:@"PicRecognitionLetter-8.png" forKey:questionKey];
    [questionDic8 setObject:@"PicRecognitionImg-8.png" forKey:correctAnsKey];
    
    [questionDic8 setObject:@"PicRecognitionImg-8.png" forKey:option1Key];
    [questionDic8 setObject:@"PicRecognitionImg-2.png" forKey:option2Key];
    [questionDic8 setObject:@"PicRecognitionImg-26.png" forKey:option3Key];
    
    [dataArray addObject:questionDic8];
    //Q9
    [questionDic9 setObject:@"PicRecognitionLetter-9.png" forKey:questionKey];
    [questionDic9 setObject:@"PicRecognitionImg-9.png" forKey:correctAnsKey];
    
    [questionDic9 setObject:@"PicRecognitionImg-9.png" forKey:option1Key];
    [questionDic9 setObject:@"PicRecognitionImg-11.png" forKey:option2Key];
    [questionDic9 setObject:@"PicRecognitionImg-16.png" forKey:option3Key];
    
    [dataArray addObject:questionDic9];
    //Q10
    [questionDic10 setObject:@"PicRecognitionLetter-10.png" forKey:questionKey];
    [questionDic10 setObject:@"PicRecognitionImg-10.png" forKey:correctAnsKey];
    
    [questionDic10 setObject:@"PicRecognitionImg-10.png" forKey:option1Key];
    [questionDic10 setObject:@"PicRecognitionImg-17.png" forKey:option2Key];
    [questionDic10 setObject:@"PicRecognitionImg-18.png" forKey:option3Key];
    
    [dataArray addObject:questionDic10];
    //Q11
    [questionDic11 setObject:@"PicRecognitionLetter-11.png" forKey:questionKey];
    [questionDic11 setObject:@"PicRecognitionImg-11.png" forKey:correctAnsKey];
    
    [questionDic11 setObject:@"PicRecognitionImg-11.png" forKey:option1Key];
    [questionDic11 setObject:@"PicRecognitionImg-12.png" forKey:option2Key];
    [questionDic11 setObject:@"PicRecognitionImg-13.png" forKey:option3Key];
    
    [dataArray addObject:questionDic11];
    //Q12
    [questionDic12 setObject:@"PicRecognitionLetter-12.png" forKey:questionKey];
    [questionDic12 setObject:@"PicRecognitionImg-12.png" forKey:correctAnsKey];
    
    [questionDic12 setObject:@"PicRecognitionImg-12.png" forKey:option1Key];
    [questionDic12 setObject:@"PicRecognitionImg-13.png" forKey:option2Key];
    [questionDic12 setObject:@"PicRecognitionImg-14.png" forKey:option3Key];
    
    [dataArray addObject:questionDic12];
    //Q13
    [questionDic13 setObject:@"PicRecognitionLetter-13.png" forKey:questionKey];
    [questionDic13 setObject:@"PicRecognitionImg-13.png" forKey:correctAnsKey];
    
    [questionDic13 setObject:@"PicRecognitionImg-13.png" forKey:option1Key];
    [questionDic13 setObject:@"PicRecognitionImg-14.png" forKey:option2Key];
    [questionDic13 setObject:@"PicRecognitionImg-15.png" forKey:option3Key];
    
    [dataArray addObject:questionDic13];
    //Q14
    [questionDic14 setObject:@"PicRecognitionLetter-14.png" forKey:questionKey];
    [questionDic14 setObject:@"PicRecognitionImg-14.png" forKey:correctAnsKey];
    
    [questionDic14 setObject:@"PicRecognitionImg-14.png" forKey:option1Key];
    [questionDic14 setObject:@"PicRecognitionImg-15.png" forKey:option2Key];
    [questionDic14 setObject:@"PicRecognitionImg-16.png" forKey:option3Key];
    
    [dataArray addObject:questionDic14];
    //Q15
    [questionDic15 setObject:@"PicRecognitionLetter-15.png" forKey:questionKey];
    [questionDic15 setObject:@"PicRecognitionImg-15.png" forKey:correctAnsKey];
    
    [questionDic15 setObject:@"PicRecognitionImg-15.png" forKey:option1Key];
    [questionDic15 setObject:@"PicRecognitionImg-16.png" forKey:option2Key];
    [questionDic15 setObject:@"PicRecognitionImg-17.png" forKey:option3Key];
    
    [dataArray addObject:questionDic15];
    
    //Q16
    [questionDic16 setObject:@"PicRecognitionLetter-16.png" forKey:questionKey];
    [questionDic16 setObject:@"PicRecognitionImg-16.png" forKey:correctAnsKey];
    
    [questionDic16 setObject:@"PicRecognitionImg-16.png" forKey:option1Key];
    [questionDic16 setObject:@"PicRecognitionImg-17.png" forKey:option2Key];
    [questionDic16 setObject:@"PicRecognitionImg-18.png" forKey:option3Key];
    
    [dataArray addObject:questionDic16];
    
    //Q17
    [questionDic17 setObject:@"PicRecognitionLetter-17.png" forKey:questionKey];
    [questionDic17 setObject:@"PicRecognitionImg-17.png" forKey:correctAnsKey];
    
    [questionDic17 setObject:@"PicRecognitionImg-17.png" forKey:option1Key];
    [questionDic17 setObject:@"PicRecognitionImg-18.png" forKey:option2Key];
    [questionDic17 setObject:@"PicRecognitionImg-18.png" forKey:option3Key];
    
    [dataArray addObject:questionDic17];
    //Q18
    [questionDic18 setObject:@"PicRecognitionLetter-18.png" forKey:questionKey];
    [questionDic18 setObject:@"PicRecognitionImg-18.png" forKey:correctAnsKey];
    
    [questionDic18 setObject:@"PicRecognitionImg-18.png" forKey:option1Key];
    [questionDic18 setObject:@"PicRecognitionImg-19.png" forKey:option2Key];
    [questionDic18 setObject:@"PicRecognitionImg-20.png" forKey:option3Key];
    
    [dataArray addObject:questionDic18];
    
    //Q19
    [questionDic19 setObject:@"PicRecognitionLetter-19.png" forKey:questionKey];
    [questionDic19 setObject:@"PicRecognitionImg-19.png" forKey:correctAnsKey];
    
    [questionDic19 setObject:@"PicRecognitionImg-19.png" forKey:option1Key];
    [questionDic19 setObject:@"PicRecognitionImg-21.png" forKey:option2Key];
    [questionDic19 setObject:@"PicRecognitionImg-20.png" forKey:option3Key];
    
    [dataArray addObject:questionDic19];
    
    
    
    //Q20
    [questionDic20 setObject:@"PicRecognitionLetter-20.png" forKey:questionKey];
    [questionDic20 setObject:@"PicRecognitionImg-20.png" forKey:correctAnsKey];
    
    [questionDic20 setObject:@"PicRecognitionImg-20.png" forKey:option1Key];
    [questionDic20 setObject:@"PicRecognitionImg-21.png" forKey:option2Key];
    [questionDic20 setObject:@"PicRecognitionImg-22.png" forKey:option3Key];
    
    [dataArray addObject:questionDic20];
    //Q21
    [questionDic21 setObject:@"PicRecognitionLetter-21.png" forKey:questionKey];
    [questionDic21 setObject:@"PicRecognitionImg-21.png" forKey:correctAnsKey];
    
    [questionDic21 setObject:@"PicRecognitionImg-21.png" forKey:option1Key];
    [questionDic21 setObject:@"PicRecognitionImg-22.png" forKey:option2Key];
    [questionDic21 setObject:@"PicRecognitionImg-23.png" forKey:option3Key];
    
    [dataArray addObject:questionDic21];
    
    //Q22
    [questionDic22 setObject:@"PicRecognitionLetter-22.png" forKey:questionKey];
    [questionDic22 setObject:@"PicRecognitionImg-22.png" forKey:correctAnsKey];
    
    [questionDic22 setObject:@"PicRecognitionImg-22.png" forKey:option1Key];
    [questionDic22 setObject:@"PicRecognitionImg-23.png" forKey:option2Key];
    [questionDic22 setObject:@"PicRecognitionImg-24.png" forKey:option3Key];
    
    [dataArray addObject:questionDic22];
    //Q23
    [questionDic23 setObject:@"PicRecognitionLetter-23.png" forKey:questionKey];
    [questionDic23 setObject:@"PicRecognitionImg-23.png" forKey:correctAnsKey];
    
    [questionDic23 setObject:@"PicRecognitionImg-23.png" forKey:option1Key];
    [questionDic23 setObject:@"PicRecognitionImg-24.png" forKey:option2Key];
    [questionDic23 setObject:@"PicRecognitionImg-25.png" forKey:option3Key];
    
    [dataArray addObject:questionDic23];
    //Q24
    [questionDic24 setObject:@"PicRecognitionLetter-24.png" forKey:questionKey];
    [questionDic24 setObject:@"PicRecognitionImg-24.png" forKey:correctAnsKey];
    
    [questionDic24 setObject:@"PicRecognitionImg-24.png" forKey:option1Key];
    [questionDic24 setObject:@"PicRecognitionImg-25.png" forKey:option2Key];
    [questionDic24 setObject:@"PicRecognitionImg-26.png" forKey:option3Key];
    
    [dataArray addObject:questionDic24];
    //Q25
    [questionDic25 setObject:@"PicRecognitionLetter-25.png" forKey:questionKey];
    [questionDic25 setObject:@"PicRecognitionImg-25.png" forKey:correctAnsKey];
    
    [questionDic25 setObject:@"PicRecognitionImg-25.png" forKey:option1Key];
    [questionDic25 setObject:@"PicRecognitionImg-26.png" forKey:option2Key];
    [questionDic25 setObject:@"PicRecognitionImg-27.png" forKey:option3Key];
    
    [dataArray addObject:questionDic25];
    
    
    //Q26
    [questionDic26 setObject:@"PicRecognitionLetter-26.png" forKey:questionKey];
    [questionDic26 setObject:@"PicRecognitionImg-26.png" forKey:correctAnsKey];
    
    [questionDic26 setObject:@"PicRecognitionImg-26.png" forKey:option1Key];
    [questionDic26 setObject:@"PicRecognitionImg-27.png" forKey:option2Key];
    [questionDic26 setObject:@"PicRecognitionImg-28.png" forKey:option3Key];
    
    [dataArray addObject:questionDic26];
    
    //Q27
    [questionDic27 setObject:@"PicRecognitionLetter-27.png" forKey:questionKey];
    [questionDic27 setObject:@"PicRecognitionImg-27.png" forKey:correctAnsKey];
    
    [questionDic27 setObject:@"PicRecognitionImg-27.png" forKey:option1Key];
    [questionDic27 setObject:@"PicRecognitionImg-28.png" forKey:option2Key];
    [questionDic27 setObject:@"PicRecognitionImg-29.png" forKey:option3Key];
    
    [dataArray addObject:questionDic27];
    
    //Q28
    [questionDic28 setObject:@"PicRecognitionLetter-28.png" forKey:questionKey];
    [questionDic28 setObject:@"PicRecognitionImg-28.png" forKey:correctAnsKey];
    
    [questionDic28 setObject:@"PicRecognitionImg-28.png" forKey:option1Key];
    [questionDic28 setObject:@"PicRecognitionImg-4.png" forKey:option2Key];
    [questionDic28 setObject:@"PicRecognitionImg-6.png" forKey:option3Key];
    
    [dataArray addObject:questionDic28];
    
    
    
}
-(void)setImageForIndex:(NSInteger)index{
    if (index<29) {
        NSDictionary* questionDic=dataArray[index-1];
        NSMutableArray* dicQuestionArray=[[NSMutableArray alloc] init];
        [dicQuestionArray addObject:[questionDic objectForKey:option1Key]];
        [dicQuestionArray addObject:[questionDic objectForKey:option2Key]];
        [dicQuestionArray addObject:[questionDic objectForKey:option3Key]];
        
        NSMutableArray* uniqueNumbersOrderArray=[self getUniqueOptions];
        
        _letterIV.image=[UIImage imageNamed:[questionDic objectForKey:questionKey]];
        
        _iv1.image=[UIImage imageNamed:dicQuestionArray[[uniqueNumbersOrderArray[0] intValue]]];
        _iv2.image=[UIImage imageNamed:dicQuestionArray[[uniqueNumbersOrderArray[1] intValue]]];
        _iv3.image=[UIImage imageNamed:dicQuestionArray[[uniqueNumbersOrderArray[2] intValue]]];
        
        
        _iv1.tag=[self getTagFromString:dicQuestionArray[[uniqueNumbersOrderArray[0] intValue]]];
        _iv2.tag=[self getTagFromString:dicQuestionArray[[uniqueNumbersOrderArray[1] intValue]]];
        _iv3.tag=[self getTagFromString:dicQuestionArray[[uniqueNumbersOrderArray[2] intValue]]];
        
        _letterIV.tag=[self getTagFromString:[questionDic objectForKey:correctAnsKey]];
        //[_forwardButton setEnabled:NO];
        
        [self stopAnimation];
    }
    
}

-(int)getTagFromString:(NSString*)str{
    int tag;
    
    NSArray* tockenArray=[str componentsSeparatedByString:@"-"];
    
    if ([tockenArray containsObject:@"PicRecognitionImg"]) {
        NSString* str2=[tockenArray objectAtIndex:1];
        tockenArray=[str2 componentsSeparatedByString:@"."];
        tag=[[tockenArray objectAtIndex:0] intValue];
    }
    else{
        NSString* str2=[tockenArray objectAtIndex:2];
        tockenArray=[str2 componentsSeparatedByString:@"."];
        tag=[[tockenArray objectAtIndex:0] intValue];
    }
    return tag;
}
- (void)oneTap:(UIGestureRecognizer *)gesture {
     [self setUserIntrectionDisable];
    NSInteger myViewTag = gesture.view.tag;
    
    if (myViewTag==_letterIV.tag) {
        NSLog(@"correct");
        
          [self playSoundFile:@"Great_Job_2"];
       // [self speakString:@"أوه لا ، حاول مرة أخرى"];
        
        [_forwardButton setEnabled:YES];
        [self playFireWorkAnimation];
        
       
        [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(forwardButtonTapped:) userInfo:nil repeats:NO];
        
    }
    else{
        NSLog(@"%ld", (long)myViewTag);
        [self playSoundFile:@"Oh_No_1"];
        //[self speakString:@"عمل جيد . استمر امضي قدما."];
        
        [self stopAnimation];
        
    }
    
}

- (IBAction)homeButtonTepped:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)forwardButtonTapped:(id)sender {
   // [self setUserIntrectionEnable];

    if (arrayCounter<28) {
        arrayCounter++;
        if([shared ShouldShowVideoAd]){
            [self showVideoAd];
        }
        
    }
    else
    {
        arrayCounter=1;
        if([shared ShouldShowVideoAd]){
            [self showVideoAd];
        }
    }
    [self setImageForIndex:arrayCounter];
}
-(void)setUserIntrectionEnable{
    [_iv1 setUserInteractionEnabled:YES];
    [_iv2 setUserInteractionEnabled:YES];
    [_iv3 setUserInteractionEnabled:YES];
}
-(void)setUserIntrectionDisable{
    [_iv1 setUserInteractionEnabled:NO];
    [_iv2 setUserInteractionEnabled:NO];
    [_iv3 setUserInteractionEnabled:NO];
    
}
-(NSMutableArray*)getUniqueOptions{
    uniqueOptionArray=[[ NSMutableArray alloc] init];
    for (int i=0; i<3; i++) {
        int randNo=[self getRndomNo];
        while (![self isUniqNo:randNo]) {
            randNo=[self getRndomNo];
        }
    }
    
    return uniqueOptionArray;
}
-(int)getRndomNo{
    return arc4random_uniform(3);
}
-(BOOL)isUniqNo:(int)number{
    BOOL isUniq;
    if ([uniqueOptionArray containsObject:[NSNumber numberWithInt:number]]) {
        isUniq=NO;
    }
    else{
        isUniq=YES;
        [uniqueOptionArray addObject:[NSNumber numberWithInt:number]];
    }
    return isUniq;
}

-(void)playSoundFile:(NSString*)fileNmae{
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:fileNmae
                                         ofType:@"mp3"]];
    
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc]
                   initWithContentsOfURL:url
                   error:&error];
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        audioPlayer.delegate = self;
        [audioPlayer prepareToPlay];
        [audioPlayer play];
    }
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if ([touches count] == 1) {
        
        UITouch* touchedObject=[touches anyObject];
        if ([touches count]==1) {
            NSLog(@"%ld", touchedObject.view.tag);
            if (touchedObject.view.tag>0){
                CGPoint touchPoint = [[touches anyObject] locationInView:self.view];
                rootPoint.x=touchPoint.x;
                rootPoint.y=touchPoint.y;
                touchOffset = CGPointMake((touchPoint.x-touchedObject.view.frame.origin.x),
                                          (touchPoint.y-touchedObject.view.frame.origin.y));
                intialFrame=touchedObject.view.frame;
                
                [touchedObject.view setFrame:CGRectMake(touchedObject.view.frame.origin.x+2,touchedObject.view.frame.origin.y+2,touchedObject.view.frame.size.width-4  ,touchedObject.view.frame.size.height-4)];
            }
        }
    }
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if ([touches count] == 1) {
        
        UITouch* touchedObject=[touches anyObject];
        if ([touches count]==1) {
            NSLog(@"%ld", touchedObject.view.tag);
            if (touchedObject.view.tag>0){
                
                
                touchedObject.view.frame=intialFrame;
            }
        }
    }
}
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if ([touches count] == 1) {
        
        UITouch* touchedObject=[touches anyObject];
        if ([touches count]==1) {
            NSLog(@"%ld", touchedObject.view.tag);
            if (touchedObject.view.tag>0){
                touchedObject.view.frame=intialFrame;
            }
        }
    }
}

-(void)changeFireWorkImage{
    
    if (fireworkCounter1==30) {
        fireworkCounter1=1;
    }
    if (fireworkCounter2==30) {
        fireworkCounter2=1;
    }
    
    
    
    NSString* imageName1=[NSString stringWithFormat:@"%@%i.png",@"FW",fireworkCounter1];
    NSString* imageName2=[NSString stringWithFormat:@"%@%i.png",@"FW",fireworkCounter2];
    [self.firework1 setImage:[UIImage imageNamed:imageName1]];
    [self.firework2 setImage:[UIImage imageNamed:imageName2]];
    
    fireworkCounter1++;
    fireworkCounter2++;
}
-(void)playFireWorkAnimation{
    [firworkTimer invalidate];
    _firework1.hidden=NO;
    _firework2.hidden=NO;
    firworkTimer=[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(changeFireWorkImage) userInfo:nil repeats:YES];
}
-(void)stopAnimation{
    [firworkTimer invalidate];
    _firework1.hidden=YES;
    _firework2.hidden=YES;
}
-(void)speakString:(NSString*)strToSpeech{
  
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:strToSpeech];
    
    utterance.rate = AVSpeechUtteranceDefaultSpeechRate;
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"ar-SA"];
    [self.synthesizer speakUtterance:utterance];
}
-(void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance {
    [self setUserIntrectionEnable];
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player
                       successfully:(BOOL)flag{
    [self setUserIntrectionEnable];
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
    
//    [self loadVideoAd];
}
@end
