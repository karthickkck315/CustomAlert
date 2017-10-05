//
//  AppDelegate.h
//  CustomAlert
//
//  Created by karthick on 10/5/17.
//  Copyright © 2017 Technoduce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomIOSAlertView.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,CustomIOSAlertViewDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (AppDelegate *)sharedInstance;
+(void)secondCustomAlertView:(NSString *)title message:(NSString *)Message view:(UIView *)View;
+(void)customIOS7dialogButtonTouchUpInside: (CustomIOSAlertView *)alertView clickedButtonAtIndex: (NSInteger)buttonIndex;
+ (UIView *)createDemoView:(NSString *)title message:(NSString *)message;
@end

