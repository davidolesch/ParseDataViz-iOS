#import <UIKit/UIKit.h>
#import "PDVClassDetailView.h"
#import "PDVClassDetailPresenter.h"

#define kClassDetailViewControllerStoryboardID @"ClassDetailViewController"

@interface PDVClassDetailViewController : UIViewController <PDVClassDetailView>

@property (strong, nonatomic) PDVClassDetailPresenter *presenter;

@end
