#import <Foundation/Foundation.h>
#import "PDVAppListInteractorIO.h"

@interface PDVAppListInteractor : NSObject <PDVAppListInteractorInput>

@property (weak, nonatomic) id<PDVAppListInteractorOutput> presenter;

@end
