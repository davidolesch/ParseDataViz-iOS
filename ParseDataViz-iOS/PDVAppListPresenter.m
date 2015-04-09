#import "PDVAppListPresenter.h"

@implementation PDVAppListPresenter

- (void)updateView {
    [self.interactor requestAppsList];
}

- (void)updateAppsList:(NSArray *)apps {
    [self.view reloadListWithRows:apps];
}

- (void)selectAppNamed:(NSString *)appName {
    [self.interactor requestClassesForAppNamed:appName];
}

- (void)updateClasses:(NSArray *)classes forAppNamed:(NSString *)appName {
    if (classes.count > 1) {
        [self.appWireframe presentClassListForAppNamed:appName];
    }
    else if (classes.count == 1) {
        [self.appWireframe presentDetailViewForAppNamed:appName andClassNamed:classes.firstObject];
    }
    else {
        [self.view showNoClassesFoundAlertForAppNamed:appName];
    }
}

@end
