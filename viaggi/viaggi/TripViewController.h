//
//  TripViewController.h
//  viaggi
//
//  Created by Estefanía Ortiz on 7/28/13.
//  Copyright (c) 2013 Estefanía Ortiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TripViewController : UIViewController{
    IBOutlet UILabel *tripText;
}

@property (nonatomic, retain) UILabel *tripText;
- (IBAction)remove:(id)sender;
- (IBAction)save:(id)sender;
@end
