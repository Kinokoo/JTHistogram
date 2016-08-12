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

@end
