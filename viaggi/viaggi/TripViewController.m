//
//  TripViewController.m
//  viaggi
//
//  Created by Estefanía Ortiz on 7/28/13.
//  Copyright (c) 2013 Estefanía Ortiz. All rights reserved.
//

#import "TripViewController.h"
#import "AppDelegate.h"
#import "Trip.h"
#import "Step.h"

@interface TripViewController ()

@end

@implementation TripViewController
@synthesize tripText;

Trip *trip;

- (IBAction)remove:(id)sender{
    AppDelegate *del = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *moc = del.managedObjectContext;
    NSFetchRequest *fr = [NSFetchRequest fetchRequestWithEntityName:@"Trip"];
    
    //[fr setPredicate:pred];
    
    NSArray *result = [moc executeFetchRequest:fr error:nil];
    for (int i = 0; i < result.count; i++) {
        Trip *t = result[i];
        [moc deleteObject:t];
    }
}
- (IBAction)save:(id)sender{
    AppDelegate *del = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *moc = del.managedObjectContext;
    NSFetchRequest *fr = [NSFetchRequest fetchRequestWithEntityName:@"Trip"];
    
    //[fr setPredicate:pred];
    
    NSArray *result = [moc executeFetchRequest:fr error:nil];
    for (int i = 0; i < result.count; i++) {
        Trip *t = result[i];
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
    AppDelegate *del = [UIApplication sharedApplication].delegate;
    trip = del.currentTrip;
    NSString *string = [[NSString alloc] initWithString:trip.name];
    string = [string stringByAppendingString:@": \r"];
    del.translateTypes = [[NSArray alloc] initWithObjects:@"the Caltrain",@"the BART",@"the MUNI",@"the VTA",@"your Shuttle",@"a Walk", nil];
 
    int i = 1;
    for (Step *step in del.currentTrip.steps){
        string = [string stringByAppendingString:[NSString stringWithFormat:@"%i. ", i]];
        string = [string stringByAppendingString:@"Take the "];
        string = [string stringByAppendingString:del.translateTypes[(int)step.type]];
        string = [string stringByAppendingString:@" at "];
        string = [string stringByAppendingString:[NSString stringWithFormat:@"%@",step.startTimeHour]];
        string = [string stringByAppendingString:@":"];
        string = [string stringByAppendingString:[NSString stringWithFormat:@"%@",step.startTimeMinute]];
        string = [string stringByAppendingString:@" on "];
        string = [string stringByAppendingString:step.startLocation];
        string = [string stringByAppendingString:@"\r"];
        i++;
    }
    tripText.text = string;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
