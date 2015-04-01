#import <Foundation/Foundation.h>

@protocol PDVAppListInteractorInput <NSObject>
/**
 *  Request the list of all apps.
 */
- (void)requestAppsList;
@end

@protocol PDVAppListInteractorOutput <NSObject>
/**
 *  Receive the list of all apps from the Interactor.
 *
 *  @param apps An array of all apps.
 */
- (void)updateAppsList:(NSArray *)apps;
@end