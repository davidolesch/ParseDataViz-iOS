#import "PDVAddAppInteractor.h"

@interface PDVAddAppInteractor ()

@property (strong, nonatomic) PDVDataManager *dataManager;

@end

@implementation PDVAddAppInteractor

- (instancetype)initWithDataManager:(PDVDataManager *)dataManager {
    if ((self = [super init])) {
        _dataManager = dataManager;
    }
    return self;
}

- (void)addAppNamed:(NSString *)appName withAppID:(NSString *)appID andRESTKey:(NSString *)RESTKey{
    [self.dataManager addAppNamed:appName withAppID:appID andRESTKey:RESTKey];
    [self.presenter updateAppWasAdded];
}

@end
