#import "PDVAddAppPresenter.h"

@implementation PDVAddAppPresenter

- (void)saveAppNamed:(NSString *)appName withAppID:(NSString *)appID andRESTKey:(NSString *)RESTKey {
    [self.interactor addAppNamed:appName withAppID:appID andRESTKey:RESTKey];
}

- (void)updateAppWasAdded {
    [self.view appWasAdded];
}

@end
