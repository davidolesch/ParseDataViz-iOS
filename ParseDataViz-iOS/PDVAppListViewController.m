#import "PDVAppListViewController.h"

@interface PDVAppListViewController ()

@property (strong, nonatomic) NSArray *rows;

@end

@implementation PDVAppListViewController

- (void)viewDidLoad {
    self.navigationItem.title = @"Apps";
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

#pragma mark PDVListView

- (void)reloadListWithRows:(NSArray *)rows {
    self.rows = rows;
    [self.tableView reloadData];
}

@end
