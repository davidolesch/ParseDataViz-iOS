#import <Foundation/Foundation.h>

@interface PDVUserApps : NSObject

- (void)addApp:(NSDictionary *)app;
- (NSArray *)apps;

@end
