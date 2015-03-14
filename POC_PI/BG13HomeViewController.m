//
//  BG13FirstViewController.m
//  BabyGuess2013
//
//  Created by Michael Lerche on 10/5/13.
//  Copyright (c) 2013 Michael Lerche. All rights reserved.
//

#import "BG13HomeViewController.h"
#import "PI_SettingsTableViewController.h"

@interface BG13HomeViewController ()
@property (strong, nonatomic) IBOutlet UIButton *piImageView;
@property BOOL isPM;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@end


@implementation BG13HomeViewController

@synthesize minuteTimer;
@synthesize cdDays;
@synthesize cdHours;
@synthesize cdMinute;
@synthesize cdSeconds;

NSDate* nowDate;
int seconds;
int minutes;
int hours;
int days;
int piCounter = 1;

- (void)viewDidLoad
{
    self.isPM = NO;
    self.titleLabel.text = @"3.14.15 9.26.53.589 AM";



    //[[UIWindow appearance] setTintColor:[UIColor colorWithRed:0 green:32 blue:80 alpha:1] ];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //load due date, title, guesses
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMddHHmm"];
    dueDate = [dateFormatter dateFromString:(self.isPM ? @"201503142126" : @"201503140926")];

    //self.countDownTitle.text = [BG13Data getTitle];
    //self.countDownGuesses.text = [BG13Data getGuessesTitle];
    
    //load colors
    //[[UITabBar appearance] setTintColor:[BG13Data getTintColor]];
    //_BGTitle.textColor = [BG13Data getTintColor];
    
    //self.countDownImage.image = [UIImage imageNamed:[BG13Data getImageName]];
    [self setCountDownTime];

    
    
}

- (void)viewDidAppear:(BOOL)animated {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated {
    
    NSTimer *timer;
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerTick:) userInfo:nil repeats:YES];
	self.minuteTimer = timer;
    
}

- (void) timerTick:(id)sender {
    [self setCountDownTime];
}


- (void) setCountDownTime
{
    nowDate = [NSDate date];
    NSTimeInterval timeDifference = [dueDate timeIntervalSinceDate:nowDate];
    
    div_t d = div(timeDifference, 3600 * 24);
    days = abs(d.quot);
    
    div_t h = div(d.rem, 3600);
    hours = abs(h.quot);
    
    div_t m = div(h.rem, 60);
    minutes = abs(m.quot);
    seconds = abs(m.rem);
    
    self.countDownSeconds.text = [NSString stringWithFormat:@"%02d", seconds];
    self.countDownMinutes.text = [NSString stringWithFormat:@"%02d", minutes];
    self.countDownHours.text = [NSString stringWithFormat:@"%02d", hours];
    self.countDownDays.text = [NSString stringWithFormat:@"%02d", days];
}

- (IBAction)changePi:(id)sender {
    [self.piImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"pi%i", piCounter++]] forState:UIControlStateNormal];
    if (piCounter == 8) { piCounter = 0; }
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    PI_SettingsTableViewController * pvc = segue.destinationViewController;
    pvc.isPM = self.isPM;




}
//
//- (BOOL)canPerformUnwindSegueAction:(SEL)action
//                 fromViewController:(PI_SettingsTableViewController *)fromViewController
//                         withSender:(id)sender {
//
//
//    self.isPM = fromViewController.isPM;
//    return YES;
//}

- (IBAction)unwindFromSegue:(UIStoryboardSegue *)segue {
    PI_SettingsTableViewController * pvc = segue.sourceViewController;//  destinationViewController;
    //PI_SettingsTableViewController * pvc = segue.destinationViewController;
    self.isPM = pvc.isPM;

    //load due date, title, guesses
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMddHHmm"];
    dueDate = [dateFormatter dateFromString:(self.isPM ? @"201503142126" : @"201503140926")];

    self.titleLabel.text = [NSString stringWithFormat:@"3.14.15 9.26.53.589 %@", (self.isPM ? @"PM" : @"AM")];


}
















@end
