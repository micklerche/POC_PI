//
//  BG13FirstViewController.h
//  BG2013
//
//  Created by Michael Lerche on 10/5/13.
//  Copyright (c) 2013 Michael Lerche. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "BG13Data.h"


@interface BG13HomeViewController : UIViewController{
    NSDate *dueDate;

}
@property (weak, nonatomic) IBOutlet UILabel *countDown;
@property (weak, nonatomic) IBOutlet UILabel *countDownGuesses;
@property (weak, nonatomic) IBOutlet UILabel *countDownTitle;
@property (weak, nonatomic) IBOutlet UILabel *BGTitle;
@property (weak, nonatomic) IBOutlet UIImageView *countDownImage;
@property (strong, nonatomic) IBOutlet UILabel *countDownSeconds;
@property (strong, nonatomic) IBOutlet UILabel *countDownMinutes;
@property (strong, nonatomic) IBOutlet UILabel *countDownHours;
@property (strong, nonatomic) IBOutlet UILabel *countDownDays;


@property (nonatomic, assign) NSTimer *minuteTimer;
@property int *cdDays;
@property int *cdHours;
@property int *cdMinute;
@property int *cdSeconds;

@end
