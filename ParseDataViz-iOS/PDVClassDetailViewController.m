#import "PDVClassDetailViewController.h"
#import "PDVColumnReportsCollectionViewController.h"

@interface PDVClassDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (strong, nonatomic) PDVColumnReportsCollectionViewController *columnReportsCollectionViewController;
@property (strong, nonatomic) NSString *className;

@end

@implementation PDVClassDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.presenter updateView];
}

- (void)displayLoadingClassColumnReports {
    [self.textView setText:@"Loading.."];
}

- (void)displayErrorMessage:(NSString *)errorMessage {
    [self.textView setText:errorMessage];
}

- (void)displayClassColumnReports:(TLIndexPathDataModel *)classColumnReports {
    [self.textView setText:[NSString stringWithFormat:@"Showing reports for %@",self.className]];
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
