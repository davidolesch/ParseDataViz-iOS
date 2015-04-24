#import <Foundation/Foundation.h>
#import "PDVApp.h"

@interface PDVUserApps : NSObject

- (void)addApp:(PDVApp *)app;
- (NSArray *)apps;

@end
