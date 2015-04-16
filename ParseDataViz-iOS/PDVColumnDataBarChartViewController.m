#import "PDVColumnDataBarChartViewController.h"

@interface PDVColumnDataBarChartViewController ()

@property (weak, nonatomic) IBOutlet UILabel *columnNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *distinctCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *yTitleLabel;

@property (strong, nonatomic) NSString *className;
@property (strong, nonatomic) NSDictionary *columnData;

@end

@implementation PDVColumnDataBarChartViewController

- (void)displayClassName:(NSString *)className andColumnData:(NSDictionary *)columnData {
    if (className != nil && columnData != nil && self.columnData == nil) {
        self.className = className;
        self.columnData = columnData;
    
        NSString *columnName = [NSString stringWithFormat:@"%@",columnData[@"columnName"]];
        NSString *distinctValueCount = [NSString stringWithFormat:@"%@",columnData[@"distinctValueCount"]];
        
        [self.columnNameLabel setText:columnName];
        [self.distinctCountLabel setText:[NSString stringWithFormat:@"%@ distinct %@",distinctValueCount,columnName]];
        [self.yTitleLabel setText:[NSString stringWithFormat:@"# of %@(s)",className]];
        
        UIView *barView = [self viewWithBarsForDistinctCounts:columnData[@"distinctValues"] andFrame:CGRectMake(10.f, 70.f, 290.f, 250.f)];
        [self.view addSubview:barView];
    }
}

- (UIView *)viewWithBarsForDistinctCounts:(NSArray *)distinctCounts andFrame:(CGRect)frame {
    UIView *view = [[UIView alloc] initWithFrame:frame];
    CGFloat rowHeight = 25.f;
    CGFloat barHeight = 20.f;
    
    // Draw the values.
    for (int k = 0 ; k < distinctCounts.count ; k++) {
        NSString *valueText = [NSString stringWithFormat:@"%@",distinctCounts[k][@"value"]];
        UILabel *valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.f, rowHeight * k , frame.size.width / 2.f, rowHeight)];
        [valueLabel setText:valueText];
        [view addSubview:valueLabel];
    }
    
    // Draw the counts.
    NSInteger maxCount = [[distinctCounts valueForKeyPath:@"@max.count"] integerValue];
    for (int k = 0 ; k < distinctCounts.count ; k++) {
        NSNumber *count = distinctCounts[k][@"count"];
        CGFloat barRatio = [count floatValue]/maxCount;
        
        CALayer *barLayer = [CALayer layer];
        [barLayer setFrame:CGRectMake(frame.size.width / 2.f, rowHeight * k , (frame.size.width / 2.f) * barRatio, barHeight)];
        CGFloat red = (127.f - 89.f * barRatio) / 255.f;
        CGFloat green = (204.f - 70.f * barRatio) / 255.f;
        CGFloat blue = (255.f - 58.f * barRatio) / 255.f;
        CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
        CGColorRef barColor = CGColorCreate(colorspace, (CGFloat[]){red, green, blue, 1.f});
        [barLayer setBackgroundColor:barColor];
        CGColorRelease(barColor);
        CGColorSpaceRelease(colorspace);
        
        [view.layer addSublayer:barLayer];
        
        NSString *countText = [NSString stringWithFormat:@"%@",count];
        UILabel *countLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width / 2.f, rowHeight * k , (frame.size.width / 2.f), rowHeight)];
        countLabel.textAlignment = NSTextAlignmentRight;
        [countLabel setText:countText];
        [view addSubview:countLabel];
    }
    
    return view;
}

@end
