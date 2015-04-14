#import "TLCollectionViewController.h"

#define kEmbedColumnReportsCollectionViewControllerSegueIdentifier @"EmbedColumnReportsCollectionViewController"

@interface PDVColumnReportsCollectionViewController : TLCollectionViewController

- (void)displayColumnsReportsForClassName:(NSString *)className andColumnReports:(TLIndexPathDataModel *)columnReports;

@end
