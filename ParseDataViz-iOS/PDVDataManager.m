#import "PDVDataManager.h"

@implementation PDVDataManager

+ (NSDictionary *)dataStore {
    return @{ @"0 classes": @[],
              @"1 class": @[@"1st class"],
              @"2 classes": @[@"1st class", @"2nd class"]};
}

@end
