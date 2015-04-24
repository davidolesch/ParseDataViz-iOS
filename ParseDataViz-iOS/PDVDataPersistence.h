#import <Foundation/Foundation.h>
#import "PDVUserApps.h"

@interface PDVDataPersistence : NSObject

+ (PDVDataPersistence *)sharedInstance;

- (NSArray *)allApps;
- (void)addApp:(NSDictionary *)app;
- (void)clearUserApps;

@end
