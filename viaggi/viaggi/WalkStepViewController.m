//
//  WalkStepViewController.m
//  viaggi
//
//  Created by Estefanía Ortiz on 7/27/13.
//  Copyright (c) 2013 Estefanía Ortiz. All rights reserved.
//

#import "WalkStepViewController.h"
#import "AppDelegate.h"
#import "Step.h"
#import "Trip.h"
#import "NewTripViewController.h"

@interface WalkStepViewController ()

@end

@implementation WalkStepViewController

@synthesize startLocation;
@synthesize endLocation;


- (IBAction)saveStep:(id)sender
{
    AppDelegate *appDel = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *moc = appDel.managedObjectContext;
    Step *step = [[Step alloc] initWithEntity:[NSEntityDescription entityForName:@"Step" inManagedObjectContext:moc] insertIntoManagedObjectContext:moc];
    step.type = [NSNumber numberWithInt:4];
    
    step.startLocation = startLocation.text;
    step.endLocation = endLocation.text;
    [appDel.currentTrip addStepsObject:step];
    NSError *error = nil;
    [step.managedObjectContext save:&error];
    
    NewTripViewController *add = (NewTripViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"code2040"];
    [self presentViewController:add animated:true completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
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
