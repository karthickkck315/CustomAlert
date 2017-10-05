//
//  AlertView.m
//  CustomAlert
//
//  Created by karthick on 10/5/17.
//  Copyright © 2017 Technoduce. All rights reserved.
//

#import "AlertView.h"
#import "CustomIOSAlertView.h"
#import "AppDelegate.h"

@interface AlertView ()<CustomIOSAlertViewDelegate>

@end

@implementation AlertView

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
-(void)alert:(NSString *)title message:(NSString *)Message {
    
    CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
    [alertView setContainerView:[AppDelegate createDemoView:title message:Message]];
    
    [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"Yes",@"No", nil]];
    
    [alertView setDelegate:self];
    [alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
        NSLog(@"Block: Button at position %d is clicked on alertView %d.", buttonIndex, (int)[alertView tag]);
        //        [alertView close];
    }];
    [alertView setUseMotionEffects:true];
    [alertView show];
}

-(void)customIOS7dialogButtonTouchUpInside: (CustomIOSAlertView *)alertView clickedButtonAtIndex: (NSInteger)buttonIndex {
    NSLog(@"button = %@",alertView.buttonTitles);
    NSLog(@"Delegate: Button at position %d is clicked on alertView %d.", (int)buttonIndex, (int)[alertView tag]);
    
    if ([[alertView.buttonTitles objectAtIndex:buttonIndex]isEqualToString:@"Yes"])
    {
        [alertView close];
    }
    else if ([[alertView.buttonTitles objectAtIndex:buttonIndex]isEqualToString:@"No"])
    {
        [alertView close];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)alert:(id)sender {
    [self alert:@"Alert1 Title" message:@"Your Message1"];
}
- (IBAction)alert2:(id)sender {
    
    [AppDelegate secondCustomAlertView:@"Alert2 Title" message:@"Message2" view:self.view];
}

@end
