//
//  MuniStepViewController.h
//  viaggi
//
//  Created by Estefanía Ortiz on 7/27/13.
//  Copyright (c) 2013 Estefanía Ortiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MuniStepViewController : UIViewController {
    IBOutlet UITextField *startLocation;
    IBOutlet UITextField *endLocation;
    IBOutlet UITextField *hour;
    IBOutlet UITextField *minute;
    IBOutlet UIButton *arriveBy;
    IBOutlet UIButton *departAt;
}

@property (nonatomic, retain) UITextField *startLocation;
@property (nonatomic, retain) UITextField *endLocation;
@property (nonatomic, retain) UITextField *hour;
@property (nonatomic, retain) UITextField *minute;
@property (nonatomic, retain) UIButton *arriveBy;
@property (nonatomic, retain) UIButton *departAt;
- (IBAction)selectTimeType: (id)sender;
- (IBAction)saveStep:(id)sender;

@end
