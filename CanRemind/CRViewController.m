//
//  CRViewController.m
//  CanRemind
//
//  Created by Joshua Howland on 6/5/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "CRViewController.h"

@interface CRViewController ()

@property (nonatomic, strong) IBOutlet UIDatePicker *picker;

- (IBAction)scheduleNotification10Seconds:(id)sender;

@end

@implementation CRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)scheduleNotification10Seconds:(id)sender {

    NSDate *alertTime = [[NSDate date] dateByAddingTimeInterval:10];

    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    if (localNotification) {
        localNotification.fireDate = alertTime;
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        localNotification.repeatInterval = 0;
        localNotification.soundName = @"bell_tree.mp3";
        localNotification.alertBody = @"This is a local notification";
        localNotification.applicationIconBadgeNumber = 1;
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
    
}

- (IBAction)scheduleNotificationDatePicker:(id)sender {

    UILocalNotification* localNotification = [[UILocalNotification alloc] init];
    if (localNotification) {
        localNotification.fireDate = self.picker.date;
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        localNotification.repeatInterval = 0;
        localNotification.soundName = @"bell_tree.mp3";
        localNotification.alertBody = @"This is a local notification";
        localNotification.applicationIconBadgeNumber = 1;
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }

}

@end
