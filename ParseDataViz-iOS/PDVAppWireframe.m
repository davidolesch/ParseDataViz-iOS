#import "PDVAddAppViewController.h"
#import "PDVAppWireframe.h"
#import "PDVAppListViewController.h"
#import "PDVAppListPresenter.h"
#import "PDVAppListInteractor.h"
#import "PDVClassListViewController.h"
#import "PDVClassListPresenter.h"
#import "PDVClassListInteractor.h"
#import "PDVDataManager.h"
#import "PDVClassDetailViewController.h"
#import "PDVClassDetailPresenter.h"
#import "PDVClassDetailInteractor.h"

@interface PDVAppWireframe ()

@property (strong, nonatomic) PDVAppListViewController *appListViewController;
@property (weak, nonatomic) UIWindow *window;
@property (strong, nonatomic) PDVDataManager *dataManager;

@end

@implementation PDVAppWireframe

- (instancetype)init {
    if ((self = [super init]))
    {
        PDVAppListViewController *appListViewController = [[PDVAppListViewController alloc] init];
        _dataManager = [[PDVDataManager alloc] init];
        
        PDVAppListPresenter *presenter = [[PDVAppListPresenter alloc] init];
        PDVAppListInteractor *interactor = [[PDVAppListInteractor alloc] initWithDataManager:_dataManager];
        
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
    PDVClassListInteractor *interactor = [[PDVClassListInteractor alloc] initWithDataManager:self.dataManager];
    
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

- (void)presentDetailViewForAppNamed:(NSString *)appName andClassNamed:(NSString *)className {
    PDVClassDetailViewController *detailViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:kClassDetailViewControllerStoryboardID];
    
    PDVClassDetailPresenter *presenter = [[PDVClassDetailPresenter alloc] initWithAppName:appName andClassName:className];
    PDVClassDetailInteractor *interactor = [[PDVClassDetailInteractor alloc] initWithDataManager:self.dataManager];
    
    // Strong references.
    detailViewController.presenter = presenter;
    presenter.interactor = interactor;
    
    // Weak references.
    interactor.presenter = presenter;
    presenter.view = detailViewController;
    
    UINavigationController *navigationController = [self navigationControllerFromWindow:self.window];
    [navigationController pushViewController:detailViewController animated:YES];
}

- (void)presentAddApp {
    PDVAddAppViewController *addAppViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:kAddAppViewControllerStoryboardID];
    
    PDVAddAppPresenter *presenter = [[PDVAddAppPresenter alloc] init];
    PDVAddAppInteractor *interactor = [[PDVAddAppInteractor alloc] initWithDataManager:self.dataManager];
    
    // Strong references.
    addAppViewController.presenter = presenter;
    presenter.interactor = interactor;
    
    // Weak references.
    interactor.presenter = presenter;
    presenter.view = addAppViewController;
    
    UINavigationController *addAppNavigationViewController = [[UINavigationController alloc] initWithRootViewController:addAppViewController];
    UINavigationController *navigationController = [self navigationControllerFromWindow:self.window];
    [navigationController presentViewController:addAppNavigationViewController animated:YES completion:nil];
}

@end
