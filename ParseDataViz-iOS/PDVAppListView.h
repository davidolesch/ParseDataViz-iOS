#import <Foundation/Foundation.h>

@protocol PDVAppListView <NSObject>
/**
 *  Reloads the data that is displayed with the passed array of rows. Rows are just a string.
 */
- (void)reloadListWithRows:(NSArray *)rows;
/**
 *  Alert user that no classes are available for the selected app.
 *
 *  @param appName Name of the app selected.
 */
- (void)showNoClassesFoundAlertForAppNamed:(NSString *)appName;
@end