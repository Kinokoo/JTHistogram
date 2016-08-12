//
//  JTHistogram.h
//
//  Copyright © 2016 janis.tokyo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JTHistogram : NSObject

/**
 
 Initialize with array, histogram will be calculated from 0 till the largest element in data array
 For example, if array is [2, 4, 2]
 The output will be {0:0, 1:0, 2:2, 3:0, 4:1}
 
 */
- (instancetype) initWithArray: (NSArray*) data;

/**
 
 Initialize with array and custom minimum and maximum values.
 For example, if array is [2, 4, 2], minimum is -2 and maximum is 4,
 The output will be {-2:0, -1:0, 0:0, 1:0, 2:2, 3:0, 4:1}
 If the largest value exceeds the maximum, the instogram will be incomplete.
 
 */
 
- (instancetype) initWithArray:(NSArray *)data
                          from: (NSInteger) minimum
                            to: (NSInteger) maximum;

/**
 
 Generates the histogram
 
 */

- (NSDictionary*) histogram;
    
@end
