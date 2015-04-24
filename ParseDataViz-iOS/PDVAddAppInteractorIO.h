#import <Foundation/Foundation.h>

@protocol PDVAddAppInteractorInput <NSObject>
/**
 *  Create and save a new app with the passed name.
 *
 *  @param appName The name of the app to create.
 *  @param appID   The app ID of the app to create.
 *  @param RESTKey The REST key of the app to create.
 */
- (void)addAppNamed:(NSString *)appName withAppID:(NSString *)appID andRESTKey:(NSString *)RESTKey;
@end

@protocol PDVAddAppInteractorOutput <NSObject>
/**
 *  Inform the presenter that the app was added.
 */
- (void)updateAppWasAdded;
@end