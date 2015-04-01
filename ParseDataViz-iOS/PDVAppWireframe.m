#import "PDVAppWireframe.h"
#import "PDVAppListViewController.h"
#import "PDVAppListPresenter.h"
#import "PDVAppListInteractor.h"

@interface PDVAppWireframe ()

@property (strong, nonatomic) PDVAppListViewController *appListViewController;

@end

@implementation PDVAppWireframe

- (instancetype)init {
    if ((self = [super init]))
    {
        PDVAppListViewController *appListViewController = [[PDVAppListViewController alloc] init];
        
        PDVAppListPresenter *presenter = [[PDVAppListPresenter alloc] init];
        PDVAppListInteractor *interactor = [[PDVAppListInteractor alloc] init];
        
        // Strong references.
        appListViewController.presenter = presenter;
        presenter.interactor = interactor;
        
        // Weak references.
        interactor.presenter = presenter;
        presenter.view = appListViewController;
        
        _appListViewController = appListViewController;
    }
    
    return self;
}

- (void)installRootViewControllerIntoWindow:(UIWindow *)window {
    [self showRootViewController:self.appListViewController inWindow:window];
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
