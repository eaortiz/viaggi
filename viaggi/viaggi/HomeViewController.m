//
//  FirstViewController.m
//  viaggi
//
//  Created by Estefanía Ortiz on 7/27/13.
//  Copyright (c) 2013 Estefanía Ortiz. All rights reserved.
//

#import "HomeViewController.h"
#import "NewTripViewController.h"
#import "AppDelegate.h"
#import "TripViewController.h"


#define kStdButtonWidth		106.0
#define kStdButtonHeight	40.0

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize titleLabel;

UIButton *newTrip;
NSNumber *pixels;

- (IBAction)createNewTrip:(id)sender

{
    NewTripViewController *add = (NewTripViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"code2040"];
    [self presentViewController:add animated:true completion:nil];
}

- (IBAction)goToTrip:(id)sender
{
    AppDelegate *del = [UIApplication sharedApplication].delegate;
    NSString *button = [sender titleForState:UIControlStateNormal];
    NSString *name = [[NSString alloc]initWithFormat:@"%@", button];
    NSManagedObjectContext *moc = del.managedObjectContext;
    NSFetchRequest *fr = [NSFetchRequest fetchRequestWithEntityName:@"Trip"];

    NSArray *result = [moc executeFetchRequest:fr error:nil];
    for (int i = 0; i < result.count; i++) {
        Trip *t = result[i];
        if ([name isEqualToString:t.name]){
            del.currentTrip = result[0];
            TripViewController *add = (TripViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"awesomesauce"];
            [self presentViewController:add animated:true completion:nil];
        }
    }

}

- (void)viewDidLoad
{
    
    pixels = [NSNumber numberWithInt:50];
    [super viewDidLoad];
    [self newTripInit];
    
    //NSPredicate *pred = [NSPredicate predicateWithFormat:@""];
    
    AppDelegate *del = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *moc = del.managedObjectContext;
    NSFetchRequest *fr = [NSFetchRequest fetchRequestWithEntityName:@"Trip"];
    
    //[fr setPredicate:pred];
    
    NSArray *result = [moc executeFetchRequest:fr error:nil];
    for (int i = 0; i < result.count; i++) {
        Trip *t = result[i];
        [self newViewTrip:t];
        int value = [pixels intValue];
        pixels = [NSNumber numberWithInt:value + 30];
    }
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)newViewTrip:(Trip*)t
{
    UIButton *tripEntry;
    // create a UIButton with attributed text for its title
    tripEntry = [UIButton buttonWithType:UIButtonTypeCustom];
    tripEntry.frame = CGRectMake(0.0, [pixels integerValue], 250, kStdButtonHeight);
    [tripEntry setTitle:t.name forState:UIControlStateNormal];
    [tripEntry addTarget:self action:@selector(goToTrip:) forControlEvents:UIControlEventTouchUpInside];
    if (t.name == nil) t.name = @"No Trip Name";
    // apply red text for normal state
    NSMutableAttributedString *normalAttrString = [[NSMutableAttributedString alloc] initWithString:t.name];
    [normalAttrString addAttribute:NSForegroundColorAttributeName
                                value:[UIColor orangeColor]
                                range:NSMakeRange(0, [normalAttrString length])];
    [tripEntry setAttributedTitle:normalAttrString forState:UIControlStateNormal];
    
    // apply green text for pressed state
    NSMutableAttributedString *highlightedAttrString = [[NSMutableAttributedString alloc] initWithString:t.name];
    [highlightedAttrString addAttribute:NSForegroundColorAttributeName
                                    value:[UIColor blackColor]
                                      range:NSMakeRange(0, [highlightedAttrString length])];
    [tripEntry setAttributedTitle:highlightedAttrString forState:UIControlStateHighlighted];
        
    [self.view addSubview:tripEntry];

}

- (void)newTripInit
{
    
		// create a UIButton with attributed text for its title
		newTrip = [UIButton buttonWithType:UIButtonTypeCustom];
		newTrip.frame = CGRectMake(210.0, 5.0, kStdButtonWidth, kStdButtonHeight);
		[newTrip setTitle:@"New" forState:UIControlStateNormal];
		[newTrip addTarget:self action:@selector(createNewTrip:) forControlEvents:UIControlEventTouchUpInside];
        
		// Add an accessibility label to the image.
		[newTrip setAccessibilityLabel:NSLocalizedString(@"NewTrip", @"")];
        
        // apply red text for normal state
        NSMutableAttributedString *normalAttrString = [[NSMutableAttributedString alloc] initWithString:@"New"];
        [normalAttrString addAttribute:NSForegroundColorAttributeName
                                 value:[UIColor orangeColor]
                                 range:NSMakeRange(0, [normalAttrString length])];
        [newTrip setAttributedTitle:normalAttrString forState:UIControlStateNormal];
        
        // apply green text for pressed state
        NSMutableAttributedString *highlightedAttrString = [[NSMutableAttributedString alloc] initWithString:@"New"];
        [highlightedAttrString addAttribute:NSForegroundColorAttributeName
                                      value:[UIColor blackColor]
                                      range:NSMakeRange(0, [highlightedAttrString length])];
        [newTrip setAttributedTitle:highlightedAttrString forState:UIControlStateHighlighted];
        
        [self.view addSubview:newTrip];
}

- (void)tripViewInit
{
    
}

@end
