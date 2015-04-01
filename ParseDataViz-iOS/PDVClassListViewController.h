#import <UIKit/UIKit.h>
#import "PDVClassListPresenter.h"
#import "PDVClassListView.h"

@interface PDVClassListViewController : UITableViewController <PDVClassListView>

@property (strong, nonatomic) PDVClassListPresenter *presenter;

@end
