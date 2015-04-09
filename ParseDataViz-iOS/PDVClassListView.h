#import <Foundation/Foundation.h>

@protocol PDVClassListView <NSObject>
/**
 *  Reloads the data that is displayed with the passed array of rows.
 *
 *  @param rows Each row is a string.
 */
- (void)reloadListWithRows:(NSArray *)rows;
@end