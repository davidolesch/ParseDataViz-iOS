#import <Foundation/Foundation.h>
#import "PDVClassListView.h"
#import "PDVClassListInteractorIO.h"
#import "PDVAppWireframe.h"

@interface PDVClassListPresenter : NSObject <PDVClassListInteractorOutput>

@property (weak, nonatomic) id<PDVClassListView> view;
@property (strong, nonatomic) id<PDVClassListInteractorInput> interactor;
@property (weak, nonatomic) PDVAppWireframe *appWireframe;

- (instancetype)initWithAppName:(NSString *)appName;

- (void)updateView;
- (void)selectClassNamed:(NSString *)className;

@end
