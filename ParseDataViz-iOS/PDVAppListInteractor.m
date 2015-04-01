#import "PDVAppListInteractor.h"

@implementation PDVAppListInteractor

- (void)requestAppsList {
    [self.presenter updateAppsList:@[@"Book Scan", @"Free2go", @"Wine Quiz"]];
}

@end
