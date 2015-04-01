#import <Foundation/Foundation.h>
#import "PDVAppListView.h"
#import "PDVAppListInteractorIO.h"
#import "PDVAppWireframe.h"

@interface PDVAppListPresenter : NSObject <PDVAppListInteractorOutput>

@property (weak, nonatomic) id<PDVAppListView> view;
@property (strong, nonatomic) id<PDVAppListInteractorInput> interactor;
@property (weak, nonatomic) PDVAppWireframe *appWireframe;

- (void)updateView;
- (void)selectAppNamed:(NSString *)appName;

@end
