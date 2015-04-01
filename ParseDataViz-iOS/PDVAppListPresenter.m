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
        [self.appWireframe presentDetailViewForClass:classes.firstObject];
    }
    else {
        [[[UIAlertView alloc] initWithTitle:@"No classes found" message:[NSString stringWithFormat:@"%@ doesn't have any classes associated with it",appName] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
    }
}

@end
