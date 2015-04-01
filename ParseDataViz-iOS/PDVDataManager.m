#import "PDVDataManager.h"

@implementation PDVDataManager

+ (NSDictionary *)dataStore {
    return @{ @"Book Scan": @[],
              @"Free2go": @[@"Reservation"],
              @"Wine Quiz": @[@"Activity", @"Quiz"] };
}

@end
