#import <Foundation/Foundation.h>
#import "PDVClassListInteractorIO.h"
#import "PDVDataManager.h"

@interface PDVClassListInteractor : NSObject <PDVClassListInteractorInput>

@property (weak, nonatomic) id<PDVClassListInteractorOutput> presenter;

- (instancetype)initWithDataManager:(PDVDataManager *)dataManager;

@end
