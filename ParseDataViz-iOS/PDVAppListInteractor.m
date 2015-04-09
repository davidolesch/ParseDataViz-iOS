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
    [self.presenter updateAppsList:[self.dataManager allAppNames]];
}

- (void)requestClassesForAppNamed:(NSString *)appName {
    [self.presenter updateClasses:[self.dataManager allClassNamesForAppName:appName] forAppNamed:appName];
}

@end
