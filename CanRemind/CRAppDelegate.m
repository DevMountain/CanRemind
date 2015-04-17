//
//  CRAppDelegate.m
//  CanRemind
//
//  Created by Joshua Howland on 6/5/14.
//  Updated by Taylor Mott on 4/16/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "CRAppDelegate.h"

@implementation CRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    UILocalNotification *locationNotification = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    if (locationNotification) {
        // Set icon badge number to zero
        application.applicationIconBadgeNumber = 0;
    }

    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]){ //iOS8
        
        [application registerUserNotificationSettings:
         [UIUserNotificationSettings settingsForTypes:(UIRemoteNotificationTypeBadge |
                                                       UIRemoteNotificationTypeSound |
                                                       UIRemoteNotificationTypeAlert)
                                           categories:nil]];
        [application registerForRemoteNotifications];
        
    } else {

        [application registerForRemoteNotificationTypes:(UIRemoteNotificationType)
         (UIRemoteNotificationTypeBadge |
          UIRemoteNotificationTypeSound |
          UIRemoteNotificationTypeAlert)];
        
    }

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    
    UIAlertController *notificationAlert = [UIAlertController alertControllerWithTitle:@"You were notified" message:notification.alertBody preferredStyle:UIAlertControllerStyleAlert];
    
    [notificationAlert addAction:[UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil]];
    
    [self.window.rootViewController presentViewController:notificationAlert animated:YES completion:nil];
    
    application.applicationIconBadgeNumber = 0;

}

@end
