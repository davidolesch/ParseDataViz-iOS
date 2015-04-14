#import "PDVClassDetailPresenter.h"
#import <TLIndexPathDataModel.h>

@interface PDVClassDetailPresenter ()

@property (strong, nonatomic) NSString *appName;
@property (strong, nonatomic) NSString *className;

@end

@implementation PDVClassDetailPresenter

- (instancetype)init {
    return [self initWithAppName:@"Default App Name" andClassName:@"Default Class Name"];
}

- (instancetype)initWithAppName:(NSString *)appName andClassName:(NSString *)className {
    self = [super init];
    if (self) {
        _appName = appName;
        _className = className;
    }
    return self;
}

- (void)updateView {
    [self.view displayLoadingClassColumnReports];
    [self.interactor requestClassColumnReportForAppName:self.appName andClassName:self.className];
    [self.view displayClassName:self.className];
}

- (void)updateClassColumnReport:(NSArray *)classColumns {
    TLIndexPathDataModel *classColumnReports = [[TLIndexPathDataModel alloc] initWithItems:classColumns];
    [self.view displayClassColumnReports:classColumnReports];
}

- (void)updateClassColumnReportErrorMessage:(NSString *)errorMessage {
    [self.view displayErrorMessage:errorMessage];
}

@end
