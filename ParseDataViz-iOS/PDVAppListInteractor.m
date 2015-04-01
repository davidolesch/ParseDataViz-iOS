#import "PDVAppListInteractor.h"
#import "PDVDataManager.h"

@implementation PDVAppListInteractor

- (void)requestAppsList {
    NSArray *appNames = [[PDVDataManager dataStore] allKeys];
    [self.presenter updateAppsList:appNames];
}

- (void)requestClassesForAppNamed:(NSString *)appName {
    NSArray *classNames = [PDVDataManager dataStore][appName];
    
    [self.presenter updateClasses:classNames forAppNamed:appName];
}

@end
