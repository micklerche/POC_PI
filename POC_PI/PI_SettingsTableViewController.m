//
//  PI_SettingsTableViewController.m
//  POC_PI
//
//  Created by Mick Lerche on 3/14/15.
//  Copyright (c) 2015 Mick Lerche. All rights reserved.
//

#import "PI_SettingsTableViewController.h"

@interface PI_SettingsTableViewController ()
@property (strong, nonatomic) IBOutlet UISwitch *ispmSwitch;

@end

@implementation PI_SettingsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.ispmSwitch setOn:self.isPM];
}

- (IBAction)changeSwitch:(UISwitch *)sender {
    self.isPM = self.isPM == NO;
    [sender setOn:self.isPM];
}

@end
