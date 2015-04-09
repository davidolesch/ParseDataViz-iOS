#import "PDVClassDetailViewController.h"

@interface PDVClassDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation PDVClassDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.presenter updateView];
}

- (void)displayClassColumnReports:(NSArray *)classColumnReports {
    [self.textView setText:[NSString stringWithFormat:@"%@",classColumnReports]];
}

- (void)displayClassName:(NSString *)className {
    self.navigationItem.title = className;
    self.accessibilityLabel = className;
}

@end
