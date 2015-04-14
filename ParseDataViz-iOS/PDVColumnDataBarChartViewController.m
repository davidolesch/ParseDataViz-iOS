#import "PDVColumnDataBarChartViewController.h"

@interface PDVColumnDataBarChartViewController ()

@property (weak, nonatomic) IBOutlet UILabel *columnNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *distinctCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *yTitleLabel;

@property (strong, nonatomic) NSString *className;
@property (strong, nonatomic) NSDictionary *columnData;

@end

@implementation PDVColumnDataBarChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self displayClassName:self.className andColumnData:self.columnData];
}

- (void)displayClassName:(NSString *)className andColumnData:(NSDictionary *)columnData {
    if (className != nil && columnData != nil) {
        self.className = className;
        self.columnData = columnData;
    
        NSString *columnName = [NSString stringWithFormat:@"%@",columnData[@"columnName"]];
        NSString *distinctValueCount = [NSString stringWithFormat:@"%@",columnData[@"distinctValueCount"]];
        
        [self.columnNameLabel setText:columnName];
        [self.distinctCountLabel setText:[NSString stringWithFormat:@"%@ distinct %@",distinctValueCount,columnName]];
        [self.yTitleLabel setText:[NSString stringWithFormat:@"# of %@(s)",className]];
    }
}

@end
