#import <Foundation/Foundation.h>
#import "PDVListView.h"
#import "PDVAppListInteractorIO.h"

@interface PDVAppListPresenter : NSObject <PDVAppListInteractorOutput>

@property (weak, nonatomic) id<PDVListView> view;
@property (strong, nonatomic) id<PDVAppListInteractorInput> interactor;

- (void)updateView;

@end
