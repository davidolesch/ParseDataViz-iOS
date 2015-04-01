#import <Foundation/Foundation.h>

@protocol PDVAppListInteractorInput <NSObject>
/**
 *  Request the list of all apps.
 */
- (void)requestAppsList;
/**
 *  Request an array of the classes belonging to the passed app.
 *
 *  @param appName The name of the app.
 */
- (void)requestClassesForAppNamed:(NSString *)appName;
@end

@protocol PDVAppListInteractorOutput <NSObject>
/**
 *  Receive the list of all apps from the Interactor.
 *
 *  @param apps An array of all apps.
 */
- (void)updateAppsList:(NSArray *)apps;
/**
 *  Receive the array of classes for an app from the Interactor.
 *
 *  @param classCount The number of classes belonging to the app.
 *  @param appName    The name of the app.
 */
- (void)updateClasses:(NSArray *)classes forAppNamed:(NSString *)appName;
@end