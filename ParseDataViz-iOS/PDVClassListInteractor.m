#import "PDVClassListInteractor.h"
#import "PDVDataManager.h"

@implementation PDVClassListInteractor

- (void)requestClassesListForAppNamed:(NSString *)appName {
    NSArray *classNames = [PDVDataManager dataStore][appName];
    [self.presenter updateClassesList:classNames];
}

@end
