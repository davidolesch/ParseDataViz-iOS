#import <UIKit/UIKit.h>
#import "PDVAddAppPresenter.h"
#import "PDVAddAppView.h"

#define kAddAppViewControllerStoryboardID @"AddAppViewController"

@interface PDVAddAppViewController : UIViewController <PDVAddAppView>

@property (strong, nonatomic) PDVAddAppPresenter *presenter;

@end
