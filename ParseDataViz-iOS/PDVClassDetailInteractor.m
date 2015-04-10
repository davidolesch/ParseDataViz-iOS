#import "PDVClassDetailInteractor.h"

@interface PDVClassDetailInteractor ()

@property (strong, nonatomic) PDVDataManager *dataManager;

@end

@implementation PDVClassDetailInteractor

- (instancetype)initWithDataManager:(PDVDataManager *)dataManager {
    if ((self = [super init])) {
        _dataManager = dataManager;
    }
    return self;
}

- (void)requestClassColumnReportForAppName:(NSString *)appName andClassName:(NSString *)className {
    [self.dataManager findColumnsForAppName:appName andClassName:className withSuccess:^(NSArray *columns) {
        [self.presenter updateClassColumnReport:columns];
    } andFailure:^(NSString *errorMessage) {
        [self.presenter updateClassColumnReportErrorMessage:errorMessage];
    }];
}

@end
