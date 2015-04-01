#import <UIKit/UIKit.h>
#import "PDVAppListPresenter.h"
#import "PDVAppListView.h"

@interface PDVAppListViewController : UITableViewController <PDVAppListView>

@property (strong, nonatomic) PDVAppListPresenter *presenter;

@end
