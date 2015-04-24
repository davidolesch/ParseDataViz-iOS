#import <Foundation/Foundation.h>
#import "PDVApp.h"
#import "PDVUserApps.h"

@interface PDVDataPersistence : NSObject

+ (PDVDataPersistence *)sharedInstance;

- (NSArray *)allApps;
- (void)addApp:(PDVApp *)app;
- (void)clearUserApps;

@end
