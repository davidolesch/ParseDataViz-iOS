#import "PDVAppDelegate.h"
#import "PDVAppWireframe.h"

@interface PDVAppDelegate ()

@property (strong, nonatomic) PDVAppWireframe *appWireframe;

@end

@implementation PDVAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.appWireframe = [[PDVAppWireframe alloc] init];
    [self.appWireframe installRootViewControllerIntoWindow:self.window];
    
    return YES;
}

@end
