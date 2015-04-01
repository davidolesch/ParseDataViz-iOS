#import "PDVAppWireframe.h"
#import "PDVAppListViewController.h"
#import "PDVAppListPresenter.h"
#import "PDVAppListInteractor.h"
#import "PDVClassListViewController.h"
#import "PDVClassListPresenter.h"
#import "PDVClassListInteractor.h"

@interface PDVAppWireframe ()

@property (strong, nonatomic) PDVAppListViewController *appListViewController;
@property (weak, nonatomic) UIWindow *window;

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
        presenter.appWireframe = self;
        interactor.presenter = presenter;
        presenter.view = appListViewController;
        
        _appListViewController = appListViewController;
    }
    
    return self;
}

- (void)installRootViewControllerIntoWindow:(UIWindow *)window {
    self.window = window;
    [self showRootViewController:self.appListViewController inWindow:window];
}

- (void)showRootViewController:(UIViewController *)viewController inWindow:(UIWindow *)window {
    UINavigationController *navigationController = [self navigationControllerFromWindow:window];
    navigationController.viewControllers = @[viewController];
}


- (UINavigationController *)navigationControllerFromWindow:(UIWindow *)window {
    UINavigationController *navigationController = (UINavigationController *)[window rootViewController];
    
    return navigationController;
}

- (void)presentClassListForAppNamed:(NSString *)appName {
    PDVClassListViewController *classListViewController = [[PDVClassListViewController alloc] init];
    
    PDVClassListPresenter *presenter = [[PDVClassListPresenter alloc] initWithAppName:appName];
    PDVClassListInteractor *interactor = [[PDVClassListInteractor alloc] init];
    
    // Strong references.
    classListViewController.presenter = presenter;
    presenter.interactor = interactor;
    
    // Weak references.
    presenter.appWireframe = self;
    interactor.presenter = presenter;
    presenter.view = classListViewController;

    UINavigationController *navigationController = [self navigationControllerFromWindow:self.window];
    [navigationController pushViewController:classListViewController animated:YES];
}

- (void)presentDetailViewForClass:(NSString *)className {
    UIViewController *detailViewController = [[UIViewController alloc] init];
    [detailViewController.view setBackgroundColor:[UIColor whiteColor]];
    detailViewController.navigationItem.title = className;
    
    UINavigationController *navigationController = [self navigationControllerFromWindow:self.window];
    [navigationController pushViewController:detailViewController animated:YES];
}

@end
