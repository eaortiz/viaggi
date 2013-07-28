//
//  CustomStepViewController.h
//  viaggi
//
//  Created by Estefanía Ortiz on 7/27/13.
//  Copyright (c) 2013 Estefanía Ortiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomStepViewController : UIViewController {
    
    IBOutlet UITextField *startLocation;
    IBOutlet UITextField *endLocation;
    IBOutlet UITextField *startHour;
    IBOutlet UITextField *startMinute;
    IBOutlet UITextField *endHour;
    IBOutlet UITextField *endMinute;
    
}

@property (nonatomic, retain) UITextField *startLocation;
@property (nonatomic, retain) UITextField *endLocation;
@property (nonatomic, retain) UITextField *startHour;
@property (nonatomic, retain) UITextField *startMinute;
@property (nonatomic, retain) UITextField *endHour;
@property (nonatomic, retain) UITextField *endMinute;
- (IBAction)saveStep:(id)sender;

@end
