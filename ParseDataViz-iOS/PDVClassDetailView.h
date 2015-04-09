#import <Foundation/Foundation.h>

@protocol PDVClassDetailView <NSObject>
/**
 *  Display the reports for the passed columns.
 *
 *  @param classColumnReports The columns and associated data.
 */
- (void)displayClassColumnReports:(NSArray *)classColumnReports;
/**
 *  Display the name of the class.
 *
 *  @param className The name to display.
 */
- (void)displayClassName:(NSString *)className;
@end