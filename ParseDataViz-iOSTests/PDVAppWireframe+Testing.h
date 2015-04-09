#import "PDVAppWireframe.h"
#import "PDVDataManager.h"
#import "PDVAppListViewController.h"

@interface PDVAppWireframe (Testing)

@property (strong, nonatomic) PDVDataManager *dataManager;
@property (strong, nonatomic) PDVAppListViewController *appListViewController;

@end