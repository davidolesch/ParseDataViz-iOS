#import "PDVClassDetailViewController.h"
#import "PDVColumnReportsCollectionViewController.h"
#import <SVProgressHUD.h>

@interface PDVClassDetailViewController ()

@property (strong, nonatomic) PDVColumnReportsCollectionViewController *columnReportsCollectionViewController;
@property (strong, nonatomic) NSString *className;

@end

@implementation PDVClassDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.presenter updateView];
}

- (void)displayLoadingClassColumnReports {
    [SVProgressHUD showWithStatus:@"Loading"];
}

- (void)displayErrorMessage:(NSString *)errorMessage {
    [SVProgressHUD showErrorWithStatus:errorMessage];
}

- (void)displayClassColumnReports:(TLIndexPathDataModel *)classColumnReports {
    [SVProgressHUD dismiss];
    [self.columnReportsCollectionViewController displayColumnsReportsForClassName:self.className andColumnReports:classColumnReports];
}

- (void)displayClassName:(NSString *)className {
    self.className = className;
    self.navigationItem.title = className;
    self.accessibilityLabel = className;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:kEmbedColumnReportsCollectionViewControllerSegueIdentifier]) {
        self.columnReportsCollectionViewController = segue.destinationViewController;
    }
}

@end
