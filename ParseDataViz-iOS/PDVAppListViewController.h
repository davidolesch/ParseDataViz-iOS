#import <UIKit/UIKit.h>
#import "PDVAppListPresenter.h"
#import "PDVListView.h"

@interface PDVAppListViewController : UITableViewController <PDVListView>

@property (strong, nonatomic) PDVAppListPresenter *presenter;

@end
