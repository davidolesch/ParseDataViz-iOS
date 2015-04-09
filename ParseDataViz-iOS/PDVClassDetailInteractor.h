#import <Foundation/Foundation.h>
#import "PDVClassDetailInteractorIO.h"
#import "PDVDataManager.h"

@interface PDVClassDetailInteractor : NSObject <PDVClassDetailInteractorInput>

@property (weak, nonatomic) id<PDVClassDetailInteractorOutput> presenter;

- (instancetype)initWithDataManager:(PDVDataManager *)dataManager;

@end
