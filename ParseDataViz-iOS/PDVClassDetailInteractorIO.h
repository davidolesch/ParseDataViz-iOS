#import <Foundation/Foundation.h>

@protocol PDVClassDetailInteractorInput <NSObject>
/**
 *  Request the reports for the columns of the passed app and class.
 *
 *  @param appName   The app of the class of the columns to report on.
 *  @param className The class of the columns to report on.
 */
- (void)requestClassColumnReportForAppName:(NSString *)appName andClassName:(NSString *)className;
@end

@protocol PDVClassDetailInteractorOutput <NSObject>
/**
 *  Receive the reports for the requested class's columns.
 *
 *  @param classColumns The columns and associated data.
 */
- (void)updateClassColumnReport:(NSArray *)classColumns;
@end