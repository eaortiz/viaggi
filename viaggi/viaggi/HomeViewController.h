//
//  FirstViewController.h
//  viaggi
//
//  Created by Estefanía Ortiz on 7/27/13.
//  Copyright (c) 2013 Estefanía Ortiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController {
    UILabel *titleLabel;
    UIButton *newTrip;
}
@property(nonatomic, retain) IBOutlet UILabel *titleLabel;
-(IBAction) createNewTrip:(id)sender;


@end
