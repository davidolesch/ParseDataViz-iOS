#import "PDVAppListViewController.h"

@interface PDVAppListViewController ()

@property (strong, nonatomic) NSArray *rows;

@end

@implementation PDVAppListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Apps";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self.presenter action:@selector(selectAddApp)];
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
    cell.accessibilityLabel = row;
    
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
    [self.presenter selectAppNamed:row];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark PDVListView

- (void)reloadListWithRows:(NSArray *)rows {
    self.rows = rows;
    [self.tableView reloadData];
}

- (void)showNoClassesFoundAlertForAppNamed:(NSString *)appName {
    [[[UIAlertView alloc] initWithTitle:@"No classes found" message:[NSString stringWithFormat:@"%@ doesn't have any classes associated with it",appName] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
}

@end
