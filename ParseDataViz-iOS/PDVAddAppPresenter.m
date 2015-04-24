#import "PDVAddAppPresenter.h"

@implementation PDVAddAppPresenter

- (void)saveAppNamed:(NSString *)appName {
    [self.interactor addAppNamed:appName];
}

- (void)updateAppWasAdded {
    [self.view appWasAdded];
}

@end
