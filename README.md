# JTHistogram

Pure ObjectiveC histogram data generator.

Made to be functional with the goal to play with numbers. Performance was not the goal, so if you are looking for the fastest histogram generator on the planet, please call some other day.

### Initialization:

Create an instance of JTHistogram using one of these initializers:

    - (instancetype) initWithArray: (NSArray*) data;

or

    - (instancetype) initWithArray:(NSArray *)data
                        from: (NSInteger) minimum
                          to: (NSInteger) maximum;

### Hints:

- data must be a pointer to an NSArray populated with NSNumbers.
- maximum and minimum specify the range of the histogram. For example, if you want a histogram which starts at -50 and ends at 50, you should specify it using these parameters. If the parameters are left unspecified (the first initializer), histogram will determine its range automatically, starting from 0 till the largest number found in the distribution.

### Usage example:

To make it even more clear, here is a sample code which shows the generation of a super simple histogram data:

    array = [@[@(2), @(4), @(2)] mutableCopy];

    JTHistogram *histogram = [[JTHistogram alloc] initWithArray: array];
    NSDictionary *histogramDict = [histogram histogram];
    NSDictionary *relativeHistogramDict = [histogram relativeHistogram];

Please feel free to fork, spoon, modify and suggest new features!
