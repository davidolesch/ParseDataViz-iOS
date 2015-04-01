#import <Foundation/Foundation.h>
#import "PDVClassListInteractorIO.h"

@interface PDVClassListInteractor : NSObject <PDVClassListInteractorInput>

@property (weak, nonatomic) id<PDVClassListInteractorOutput> presenter;

@end
