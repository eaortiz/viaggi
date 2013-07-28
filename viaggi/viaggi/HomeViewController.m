//
//  FirstViewController.m
//  viaggi
//
//  Created by Estefanía Ortiz on 7/27/13.
//  Copyright (c) 2013 Estefanía Ortiz. All rights reserved.
//

#import "HomeViewController.h"
#import "NewTripViewController.h"

#define kStdButtonWidth		106.0
#define kStdButtonHeight	40.0

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize titleLabel;

- (IBAction)createNewTrip:(id)sender
{
    NewTripViewController *add = (NewTripViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"code2040"];
    [self presentViewController:add animated:true completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self newTripInit];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)newTripInit
{
    if (newTrip == nil)
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
}

- (void)tripViewInit
{
    
}

@end
