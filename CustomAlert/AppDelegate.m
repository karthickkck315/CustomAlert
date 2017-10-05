//
//  AppDelegate.m
//  CustomAlert
//
//  Created by karthick on 10/5/17.
//  Copyright © 2017 Technoduce. All rights reserved.
//

#import "AppDelegate.h"
#import "CustomIOSAlertView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//CustomAlertView
+ (UIView *)createDemoView:(NSString *)title message:(NSString *)message{
    
    UIView *demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 290, 50)];
    demoView.backgroundColor = [UIColor whiteColor];
    demoView.layer.cornerRadius = 6.0f;
    demoView.clipsToBounds = YES;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20, 20, demoView.frame.size.width-40, demoView.frame.size.height-40)];
    view.backgroundColor = [UIColor whiteColor];
    [demoView addSubview:view];
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, 50)];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:14];
    label.text = title;
    [view addSubview:label];
    
    UILabel *fromLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, label.frame.origin.y+label.frame.size.height+5, view.frame.size.width-20, view.frame.size.height-20)];
    CGSize maximumLabelSize = CGSizeMake(296, FLT_MAX);
    CGRect textRect = [message boundingRectWithSize:maximumLabelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f]} context:nil];
    CGSize expectedLabelSize = textRect.size;
    
    CGRect newFrame = fromLabel.frame;
    newFrame.size.height = expectedLabelSize.height;
    fromLabel.numberOfLines=0;
    fromLabel.frame = newFrame;
    demoView.frame = CGRectMake(0, 0, 290, newFrame.size.height+60+label.frame.size.height);
    view.frame = CGRectMake(20, 20, demoView.frame.size.width-40, demoView.frame.size.height-40);
    fromLabel.font=[UIFont systemFontOfSize:14];
    fromLabel.text = message;
    fromLabel.numberOfLines = 0;
    fromLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
    fromLabel.adjustsFontSizeToFitWidth = YES;
    fromLabel.clipsToBounds = YES;
    fromLabel.backgroundColor = [UIColor clearColor];
    fromLabel.textColor = [UIColor blackColor];
    fromLabel.textAlignment = NSTextAlignmentCenter;
    [view addSubview:fromLabel];
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight) cornerRadii:CGSizeMake(10.0, 10.0)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    maskLayer.path  = maskPath.CGPath;
    view.layer.mask = maskLayer;
    
    CAShapeLayer *borderLayer = [[CAShapeLayer alloc] init];
    borderLayer.frame = view.bounds;
    borderLayer.path  = maskPath.CGPath;
    borderLayer.lineWidth   = 1.0f;
    borderLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    borderLayer.fillColor   = [UIColor clearColor].CGColor;
    
    [view.layer addSublayer:borderLayer];
    
    
    return demoView;
}


//Alert 2
+(void)secondCustomAlertView:(NSString *)title message:(NSString *)Message view:(UIViewController *)delegate{
    
    CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
    
    // Add some custom content to the alert view
    [alertView setContainerView:[self createDemoView:title message:Message]];
    
    // Modify the parameters
    [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"NO", @"YES", nil]];
    [alertView setDelegate:(id)self];
    
    // You may use a Block, rather than a delegate.
    [alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
        NSLog(@"Block: Button at position %d is clicked on alertView %d.", buttonIndex, (int)[alertView tag]);
        [alertView close];
    }];
    
    [alertView setUseMotionEffects:true];
    
    // And launch the dialog
    [alertView show];
    
}
//Alert 2 action
+(void)customIOS7dialogButtonTouchUpInside: (CustomIOSAlertView *)alertView clickedButtonAtIndex: (NSInteger)buttonIndex {
    NSLog(@"Delegate: Button at position %d is clicked on alertView %d.", (int)buttonIndex, (int)[alertView tag]);
    [alertView close];
}


+ (AppDelegate *)sharedInstance
{
    static AppDelegate *sharedInstance;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}


@end
