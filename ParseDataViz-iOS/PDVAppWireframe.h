#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PDVAppWireframe : NSObject

- (void)installRootViewControllerIntoWindow:(UIWindow *)window;
- (void)presentClassListForAppNamed:(NSString *)appName;
- (void)presentDetailViewForClass:(NSString *)className;

@end
