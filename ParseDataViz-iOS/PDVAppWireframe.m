#import "PDVAppWireframe.h"

@implementation PDVAppWireframe

- (void)installRootViewControllerIntoWindow:(UIWindow *)window {
    UITableViewController *aTableViewControll = [[UITableViewController alloc] init];
    [self showRootViewController:aTableViewControll inWindow:window];
}

- (void)showRootViewController:(UIViewController *)viewController
                      inWindow:(UIWindow *)window {
    UINavigationController *navigationController = [self navigationControllerFromWindow:window];
    navigationController.viewControllers = @[viewController];
}


- (UINavigationController *)navigationControllerFromWindow:(UIWindow *)window {
    UINavigationController *navigationController = (UINavigationController *)[window rootViewController];
    
    return navigationController;
}

@end
