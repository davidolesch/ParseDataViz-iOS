#import <Foundation/Foundation.h>
#import "PDVAddAppInteractor.h"
#import "PDVAddAppInteractorIO.h"
#import "PDVAddAppView.h"

@interface PDVAddAppPresenter : NSObject <PDVAddAppInteractorOutput>

@property (weak, nonatomic) id<PDVAddAppView> view;
@property (strong, nonatomic) PDVAddAppInteractor *interactor;

- (void)saveAppNamed:(NSString *)appName withAppID:(NSString *)appID andRESTKey:(NSString *)RESTKey;

@end
