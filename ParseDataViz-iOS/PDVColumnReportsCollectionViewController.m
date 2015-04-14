#import "PDVColumnDataBarChartViewController.h"
#import "PDVColumnReportsCollectionViewController.h"

@interface PDVColumnReportsCollectionViewController ()

@property (strong, nonatomic) NSString *className;

@end

@implementation PDVColumnReportsCollectionViewController

- (void)displayColumnsReportsForClassName:(NSString *)className andColumnReports:(TLIndexPathDataModel *)columnReports {
    self.className = className;
    self.indexPathController.dataModel = columnReports;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [super collectionView:collectionView cellForItemAtIndexPath:indexPath];
    PDVColumnDataBarChartViewController *columnDataBarChartViewController = (PDVColumnDataBarChartViewController *)[self collectionView:collectionView viewControllerForCell:cell];
    NSDictionary *columnData = [self.indexPathController.dataModel itemAtIndexPath:indexPath];
    [columnDataBarChartViewController displayClassName:self.className andColumnData:columnData];
    return cell;
}

- (UIViewController *)collectionView:(UICollectionView *)collectionView instantiateViewControllerForCell:(UICollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    PDVColumnDataBarChartViewController *columnDataBarChartViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:kColumnDataBarChartViewControllerStoryboardID];
    columnDataBarChartViewController.view.frame = cell.bounds;
    [cell addSubview:columnDataBarChartViewController.view];
    return columnDataBarChartViewController;
}

@end
