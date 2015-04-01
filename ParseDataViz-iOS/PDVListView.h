#import <Foundation/Foundation.h>

@protocol PDVListView <NSObject>

/**
 *  Reloads the data that is displayed with the passed array of rows. Rows are just a string.
 */
- (void)reloadListWithRows:(NSArray *)rows;

@end