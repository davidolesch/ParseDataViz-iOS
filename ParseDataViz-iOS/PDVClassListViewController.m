#import "PDVClassListViewController.h"

@interface PDVClassListViewController ()

@property (strong, nonatomic) NSArray *rows;

@end

@implementation PDVClassListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Classes";
    self.accessibilityLabel = self.navigationItem.title;
    [self.presenter updateView];
}

#pragma mark UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSString *row = self.rows[indexPath.row];
    cell.textLabel.text = row;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.rows.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *row = self.rows[indexPath.row];
    [self.presenter selectClassNamed:row];
}

#pragma mark PDVListView

- (void)reloadListWithRows:(NSArray *)rows {
    self.rows = rows;
    [self.tableView reloadData];
}

@end
