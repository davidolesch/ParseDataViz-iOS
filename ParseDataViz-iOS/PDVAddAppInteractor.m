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

- (void)addAppNamed:(NSString *)appName {
    [self.dataManager addAppNamed:appName];
    [self.presenter updateAppWasAdded];
}

@end
