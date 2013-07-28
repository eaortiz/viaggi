//
//  SecondViewController.h
//  viaggi
//
//  Created by Estefanía Ortiz on 7/27/13.
//  Copyright (c) 2013 Estefanía Ortiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewTripViewController : UIViewController {
    IBOutlet UITextField *nameInput;
    IBOutlet UIButton *weekdayButton;
    IBOutlet UIButton *saturdayButton;
    IBOutlet UIButton *sundayButton;
    IBOutlet UILabel *textLabel;
    
}

@property (nonatomic, retain) UITextField *nameInput;
@property (nonatomic, retain) UIButton *weekdayButton;
@property (nonatomic, retain) UIButton *saturdayButton;
@property (nonatomic, retain) UIButton *sundayButton;
@property (nonatomic, retain) UILabel *textLabel;

- (IBAction)addStep:(id)sender;


@end
