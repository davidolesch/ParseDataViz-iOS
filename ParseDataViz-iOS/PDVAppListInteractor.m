#import "PDVAppListInteractor.h"
#import "PDVDataManager.h"

@interface PDVAppListInteractor ()

@property (strong, nonatomic) PDVDataManager *dataManager;

@end

@implementation PDVAppListInteractor

- (instancetype)initWithDataManager:(PDVDataManager *)dataManager {
    if ((self = [super init])) {
        _dataManager = dataManager;
    }
    return self;
}

- (void)requestAppsList {
    NSArray *appNames = [self.dataManager.dataDictionary allKeys];
    [self.presenter updateAppsList:appNames];
}

- (void)requestClassesForAppNamed:(NSString *)appName {
    NSArray *classNames = self.dataManager.dataDictionary[appName];
    
    [self.presenter updateClasses:classNames forAppNamed:appName];
}

@end
