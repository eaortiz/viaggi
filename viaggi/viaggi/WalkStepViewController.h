//
//  WalkStepViewController.h
//  viaggi
//
//  Created by Estefanía Ortiz on 7/27/13.
//  Copyright (c) 2013 Estefanía Ortiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WalkStepViewController : UIViewController {
    IBOutlet UITextView *startLocation;
    IBOutlet UITextView *endLocation;
}

@property (nonatomic, retain) UITextView *startLocation;
@property (nonatomic, retain) UITextView *endLocation;

@end
