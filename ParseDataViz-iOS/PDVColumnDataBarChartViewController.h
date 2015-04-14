#import <UIKit/UIKit.h>

#define kColumnDataBarChartViewControllerStoryboardID @"ColumnDataBarChartViewController"

@interface PDVColumnDataBarChartViewController : UIViewController

- (void)displayClassName:(NSString *)className andColumnData:(NSDictionary *)columnData;

@end
