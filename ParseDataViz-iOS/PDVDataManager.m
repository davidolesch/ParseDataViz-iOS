#import "PDVDataManager.h"

@implementation PDVDataManager

- (instancetype)init {
    return [self initWithDictionary:@{ @"Book Scan": @[],
                                      @"Free2go": @[@"Reservation"],
                                      @"Wine Quiz": @[@"Activity", @"Quiz"] }];
}

- (instancetype)initWithDictionary:(NSDictionary *)dataDictionary {
    if ((self = [super init])) {
        _dataDictionary = dataDictionary;
    }
    
    return self;
}

@end
