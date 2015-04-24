#import <Foundation/Foundation.h>

@protocol PDVAddAppInteractorInput <NSObject>
/**
 *  Create and save a new app with the passed name.
 *
 *  @param appName The name of the app to create.
 */
- (void)addAppNamed:(NSString *)appName;
@end

@protocol PDVAddAppInteractorOutput <NSObject>
/**
 *  Inform the presenter that the app was added.
 */
- (void)updateAppWasAdded;
@end