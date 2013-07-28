//
//  SecondViewController.m
//  viaggi
//
//  Created by Estefanía Ortiz on 7/27/13.
//  Copyright (c) 2013 Estefanía Ortiz. All rights reserved.
//

#import "NewTripViewController.h"
#import "Trip.h"
#import "Step.h"
#import "AppDelegate.h"
#import "HomeViewController.h"

@interface NewTripViewController ()

@end

@implementation NewTripViewController

@synthesize nameInput;
@synthesize sundayButton;
@synthesize weekdayButton;
@synthesize saturdayButton;
@synthesize textLabel;

- (void)changeButtonsLook: (NSString*)date{
    if ([date isEqualToString:@"Weekday"]){
        [weekdayButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
        [weekdayButton setEnabled:NO];
        [saturdayButton setEnabled:YES];
        [sundayButton setEnabled:YES];
    }
    if ([date isEqualToString:@"Saturday"]) {
        [saturdayButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
        [weekdayButton setEnabled:YES];
        [saturdayButton setEnabled:NO];
        [sundayButton setEnabled:YES];
    }
    if ([date isEqualToString:@"Sunday"]) {
        [sundayButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
        [weekdayButton setEnabled:YES];
        [saturdayButton setEnabled:YES];
        [sundayButton setEnabled:NO];
    }
}

- (IBAction)createNewTrip:(id)sender
{
    AppDelegate *del = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *moc = del.managedObjectContext;
    del.currentTrip.name = nameInput.text;
    
    Trip *newTrip = [[Trip alloc] initWithEntity:[NSEntityDescription entityForName:@"Trip" inManagedObjectContext:moc] insertIntoManagedObjectContext:moc];
    del.currentTrip = newTrip;
    del.currentTrip.name = @"";
    
    HomeViewController *add = (HomeViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"homeapp"];
    [self presentViewController:add animated:true completion:nil];
}

- (IBAction)setWeekDay:(id)sender{
    AppDelegate *del = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSString *date = [sender titleForState:UIControlStateNormal];
    del.currentTrip.date = [[NSString alloc]initWithFormat:@"%@", date];
    [self changeButtonsLook:date];
}

- (IBAction)addStep:(id)sender{
    AppDelegate *del = (AppDelegate *)[UIApplication sharedApplication].delegate;
    del.currentTrip.name = nameInput.text;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate *appDel = [[UIApplication sharedApplication] delegate];
    appDel.translateTypes = [[NSArray alloc] initWithObjects:@"the Caltrain",@"the BART",@"the MUNI",@"the VTA",@"your Shuttle",@"a Walk", nil];
    if (([appDel.currentTrip.name isEqualToString:@""]) == false){
        NSString *name = [[NSString alloc] initWithString:appDel.currentTrip.name];
        nameInput.text = name;
        
        NSString *date = [[NSString alloc] initWithString:appDel.currentTrip.date];
        [self changeButtonsLook:date];
        
    }
    NSString *string = [[NSString alloc] init];
    int i = 1;
    for (Step *step in appDel.currentTrip.steps){
        string = [string stringByAppendingString:[NSString stringWithFormat:@"%i. ", i]];
        string = [string stringByAppendingString:@"Take the "];
        string = [string stringByAppendingString:appDel.translateTypes[(int)step.type]];
        string = [string stringByAppendingString:@" at "];
        string = [string stringByAppendingString:[NSString stringWithFormat:@"%@",step.startTimeHour]];
        string = [string stringByAppendingString:@":"];
        string = [string stringByAppendingString:[NSString stringWithFormat:@"%@",step.startTimeMinute]];
        string = [string stringByAppendingString:@" on "];
        string = [string stringByAppendingString:step.startLocation];
        string = [string stringByAppendingString:@"\r"];
        i++;
    }
    textLabel.text = string;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
