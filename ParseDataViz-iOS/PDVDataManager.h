#import <Foundation/Foundation.h>

@interface PDVDataManager : NSObject

- (instancetype)initWithApps:(NSArray *)apps;

- (NSArray *)allAppNames;
- (NSArray *)allClassNamesForAppName:(NSString *)appName;
- (NSString *)appIDForAppName:(NSString *)appName;
- (NSString *)RESTKeyForAppName:(NSString *)appName;

- (void)fetchColumnsForAppName:(NSString *)appName andClassName:(NSString *)className withCompletion:(void (^)(NSArray *columns))completionBlock;

@end
