#import <Foundation/Foundation.h>

@protocol PDVClassListInteractorInput <NSObject>
/**
 *  Request the list of classes for the passed app.
 *
 *  @param appName Name of the app.
 */
- (void)requestClassesListForAppNamed:(NSString *)appName;
@end

@protocol PDVClassListInteractorOutput <NSObject>
/**
 *  Receive the list of all Classes from the Interactor.
 *
 *  @param Classes An array of all Classes.
 */
- (void)updateClassesList:(NSArray *)Classes;
@end