#import <Foundation/Foundation.h>
#import "PDVAddAppInteractorIO.h"
#import "PDVDataManager.h"

@interface PDVAddAppInteractor : NSObject <PDVAddAppInteractorInput>

@property (weak, nonatomic) id<PDVAddAppInteractorOutput> presenter;

- (instancetype)initWithDataManager:(PDVDataManager *)dataManager;

@end
