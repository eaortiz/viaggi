//
//  CustomStepViewController.m
//  viaggi
//
//  Created by Estefanía Ortiz on 7/27/13.
//  Copyright (c) 2013 Estefanía Ortiz. All rights reserved.
//

#import "CustomStepViewController.h"
#import "AppDelegate.h"
#import "Trip.h"
#import "Step.h"
#import "NewTripViewController.h"

@interface CustomStepViewController ()

@end

@implementation CustomStepViewController

@synthesize startLocation;
@synthesize endLocation;
@synthesize startHour;
@synthesize startMinute;
@synthesize endHour;
@synthesize endMinute;

NSString *timeType;

- (IBAction)saveStep:(id)sender
{
    AppDelegate *del = (AppDelegate *)[UIApplication sharedApplication].delegate;
    Trip *currTrip = del.currentTrip;
    AppDelegate *appDel = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *moc = appDel.managedObjectContext;
    Step *step = [[Step alloc] initWithEntity:[NSEntityDescription entityForName:@"Step" inManagedObjectContext:moc] insertIntoManagedObjectContext:moc];
    
    step.startLocation = startLocation.text;
    step.endLocation = endLocation.text;
    NSNumber *shr = [NSNumber numberWithInt:[startHour.text intValue]];
    step.startTimeHour = shr;
    NSNumber *smn = [NSNumber numberWithInt:[startMinute.text intValue]];
    step.startTimeMinute = smn;
    NSNumber *ehr = [NSNumber numberWithInt:[endHour.text intValue]];
    step.endTimeHour = ehr;
    NSNumber *emn = [NSNumber numberWithInt:[endMinute.text intValue]];
    step.endTimeMinute = emn;
    
    step.type = [NSNumber numberWithInt:5];


    [currTrip addStepsObject:step];
    NSError *error = nil;
    [step.managedObjectContext save:&error];
    
    NewTripViewController *add = (NewTripViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"code2040"];
    [self presentViewController:add animated:true completion:nil];

    
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
