#import <Foundation/Foundation.h>
#include "PDVClassDetailView.h"
#import "PDVClassDetailInteractor.h"
#import "PDVClassDetailInteractorIO.h"

@interface PDVClassDetailPresenter : NSObject <PDVClassDetailInteractorOutput>

@property (weak, nonatomic) id<PDVClassDetailView> view;
@property (strong, nonatomic) PDVClassDetailInteractor *interactor;

- (instancetype)initWithAppName:(NSString *)appName andClassName:(NSString *)className;
- (void)updateView;

@end
