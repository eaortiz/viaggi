//
//  VTAStepViewController.m
//  viaggi
//
//  Created by Estefanía Ortiz on 7/27/13.
//  Copyright (c) 2013 Estefanía Ortiz. All rights reserved.
//

#import "VTAStepViewController.h"
#import "Step.h"
#import "Trip.h"
#import "AppDelegate.h"
#import "NewTripViewController.h"

@interface VTAStepViewController ()

@end

@implementation VTAStepViewController

@synthesize startLocation;
@synthesize endLocation;
@synthesize hour;
@synthesize minute;
@synthesize arriveBy;
@synthesize departAt;

NSString *timeType;

- (IBAction)saveStep:(id)sender
{
    AppDelegate *del = (AppDelegate *)[UIApplication sharedApplication].delegate;
    AppDelegate *appDel = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *moc = appDel.managedObjectContext;
    Step *step = [[Step alloc] initWithEntity:[NSEntityDescription entityForName:@"Step" inManagedObjectContext:moc] insertIntoManagedObjectContext:moc];
    step.type = [NSNumber numberWithInt:3];
    
    step.startLocation = startLocation.text;
    step.endLocation = endLocation.text;
    if ([timeType isEqualToString:@"Arrive By:"]){
        NSNumber *hr = [NSNumber numberWithInt:[hour.text intValue]];
        step.endTimeHour = hr;
        NSNumber *min = [NSNumber numberWithInt:[minute.text intValue]];
        step.endTimeMinute = min;
    }
    if ([timeType isEqualToString:@"Depart At:"]){
        NSNumber *hr = [NSNumber numberWithInt:[hour.text intValue]];
        step.startTimeHour = hr;
        NSNumber *min = [NSNumber numberWithInt:[minute.text intValue]];
        step.startTimeMinute = min;
    }
    [del.currentTrip addStepsObject:step];
    NSError *error = nil;
    [step.managedObjectContext save:&error];
    
    NewTripViewController *add = (NewTripViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"code2040"];
    [self presentViewController:add animated:true completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)selectTimeType:(id)sender
{
    NSString *date = [sender titleForState:UIControlStateNormal];
    timeType = [[NSString alloc]initWithFormat:@"%@", date];
    
    if ([timeType isEqualToString:@"Arrive By:"]) {
        [arriveBy setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
        [arriveBy setEnabled:NO];
        [departAt setEnabled:YES];
    }
    if ([timeType isEqualToString:@"Depart At:"]) {
        [departAt setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
        [departAt setEnabled:NO];
        [arriveBy setEnabled:YES];
    }
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
