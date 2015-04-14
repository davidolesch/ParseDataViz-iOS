#import <Foundation/Foundation.h>
#import <TLIndexPathDataModel.h>

@protocol PDVClassDetailView <NSObject>
/**
 *  Display a loading animation while the application finds class column reports.
 */
- (void)displayLoadingClassColumnReports;
/**
 *  Display the passed error message string.
 *
 *  @param errorMessage The error message to show.
 */
- (void)displayErrorMessage:(NSString *)errorMessage;
/**
 *  Display the reports for the passed columns.
 *
 *  @param classColumnReports The columns and associated data.
 */
- (void)displayClassColumnReports:(TLIndexPathDataModel *)classColumnReports;
/**
 *  Display the name of the class.
 *
 *  @param className The name to display.
 */
- (void)displayClassName:(NSString *)className;
@end