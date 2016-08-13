//
//  JTHistogram.h
//
//  Copyright © 2016 janis.tokyo. All rights reserved.
//

#import "JTHistogram.h"

@interface JTHistogram ()

@property (strong, readonly) NSArray *inputData;
@property (readonly) NSInteger minimum;
@property (readonly) NSInteger maximum;

@end

@implementation JTHistogram

- (instancetype) initWithArray: (NSArray*) data {
    self = [self initWithArray: data
                          from: 0
                            to: [[[data sortedArrayUsingSelector:@selector(compare:)] lastObject] integerValue]];

    return self;
}

- (instancetype) initWithArray:(NSArray *)data
                          from: (NSInteger) minimum
                            to: (NSInteger) maximum {
    self = [super init];
    
    if (self) {
        _inputData = [data sortedArrayUsingSelector:@selector(compare:)];
        _minimum = minimum;
        _maximum = maximum;
    }
    
    return self;
}

- (NSDictionary*) histogram {
    if (self.inputData == nil) {
        return nil;
    }
    
    NSCountedSet        *countedData = [NSCountedSet setWithArray: self.inputData];
    NSMutableDictionary *histogram   = [NSMutableDictionary dictionary];
    
    for (NSInteger i = self.minimum; i <= self.maximum; ++i) {
        histogram[@(i)] = @([countedData countForObject: @(i)]);
    }
    
    return histogram;
}

- (NSInteger) maxAbsoluteValue {
    NSCountedSet *const countedData  = [NSCountedSet setWithArray: self.inputData];
    NSInteger           maximumValue = 0;
    
    for (NSInteger i = 0; i <= [countedData count]; ++i) {
        if (([countedData countForObject:@(i)]) > maximumValue) {
            maximumValue = [countedData countForObject:@(i)];
        }
    }
    
    return maximumValue;
}

- (NSDictionary*) relativeHistogram {
    NSDictionary        *absoluteHistogram = [self histogram];
    NSMutableDictionary *relativeHistogram = [NSMutableDictionary dictionary];
    NSInteger const      maximumValue      = [self maxAbsoluteValue];
    
    [absoluteHistogram enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, NSNumber * _Nonnull currentItem, BOOL * _Nonnull stop) {
        Float32 const absoluteValue = [currentItem floatValue];
        Float32 const relativeValue = absoluteValue / (maximumValue * 0.01f);
        relativeHistogram[key] = @(relativeValue);
    }];
    
    return relativeHistogram;
}

@end
