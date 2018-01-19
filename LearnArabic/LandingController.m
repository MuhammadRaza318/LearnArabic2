//
//  LandingController.m
//  LearnArabic
//
//  Created by Mehsam Saeed on 19/04/2018.
//  Copyright © 2018 Mehsam Saeed. All rights reserved.
//

#import "LandingController.h"

@interface LandingController (){
    CGRect intialFrame;
    
    float chnageInSize,changeInOrigin;
    NSTimer* timer;
}

@end

@implementation LandingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    chnageInSize=20;
    changeInOrigin=10;
    intialFrame=self.forwardButton.frame;
    timer=[NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(startAnimation) userInfo:nil repeats:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)startAnimation{
    [UIView animateWithDuration:1 animations:^{
        [self->_forwardButton setFrame:CGRectMake(self->intialFrame.origin.x+self->changeInOrigin,self->intialFrame.origin.y+self->changeInOrigin,self->intialFrame.size.width-self->chnageInSize  ,self->intialFrame.size.height-self->chnageInSize)];
    } completion:^(BOOL finished) {
        
        
        [UIView animateWithDuration:1 animations:^{
            [self->_forwardButton setFrame:self->intialFrame];
            self->timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(startAnimation) userInfo:nil repeats:NO];
        }];
        
    }];
}

- (IBAction)test:(id)sender {
    NSLog(@"test");
    [timer invalidate];
}
@end
