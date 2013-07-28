//
//  Step.h
//  viaggi
//
//  Created by Estefanía Ortiz on 7/27/13.
//  Copyright (c) 2013 Estefanía Ortiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Step : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) NSNumber * startTimeHour;
@property (nonatomic, retain) NSNumber * endTimeHour;
@property (nonatomic, retain) NSString * startLocation;
@property (nonatomic, retain) NSString * endLocation;
@property (nonatomic, retain) NSNumber * endTimeMinute;
@property (nonatomic, retain) NSNumber * startTimeMinute;
@property (nonatomic, retain) NSData * image;
@property (nonatomic, retain) NSManagedObject *trip;

@end
