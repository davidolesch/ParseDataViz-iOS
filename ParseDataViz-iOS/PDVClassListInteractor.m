#import "PDVClassListInteractor.h"
#import "PDVDataManager.h"

@interface PDVClassListInteractor ()

@property (strong, nonatomic) PDVDataManager *dataManager;

@end

@implementation PDVClassListInteractor

- (instancetype)initWithDataManager:(PDVDataManager *)dataManager {
    if ((self = [super init])) {
        _dataManager = dataManager;
    }
    return self;
}

- (void)requestClassesListForAppNamed:(NSString *)appName {
    [self.presenter updateClassesList:[self.dataManager allClassNamesForAppName:appName]];
}

@end
