#import <Foundation/Foundation.h>
#import "PDVAppListInteractorIO.h"
#import "PDVDataManager.h"

@interface PDVAppListInteractor : NSObject <PDVAppListInteractorInput>

@property (weak, nonatomic) id<PDVAppListInteractorOutput> presenter;

- (instancetype)initWithDataManager:(PDVDataManager *)dataManager;

@end
