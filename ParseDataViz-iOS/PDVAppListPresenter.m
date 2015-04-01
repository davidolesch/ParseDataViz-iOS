#import "PDVAppListPresenter.h"

@implementation PDVAppListPresenter

- (void)updateView {
    [self.interactor requestAppsList];
}

- (void)updateAppsList:(NSArray *)apps {
    [self.view reloadListWithRows:apps];
}

@end
