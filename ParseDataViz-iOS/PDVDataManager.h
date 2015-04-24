#import <Foundation/Foundation.h>

@interface PDVDataManager : NSObject

- (instancetype)initWithApps:(NSArray *)apps;

- (NSArray *)allAppNames;
- (NSArray *)allClassNamesForAppName:(NSString *)appName;
- (NSString *)appIDForAppName:(NSString *)appName;
- (NSString *)RESTKeyForAppName:(NSString *)appName;

- (void)addAppNamed:(NSString *)appName withAppID:(NSString *)appID andRESTKey:(NSString *)RESTKey;

- (void)findColumnsForAppName:(NSString *)appName andClassName:(NSString *)className withSuccess:(void (^)(NSArray *columns))successBlock andFailure:(void (^)(NSString *errorMessage))failureBlock;

@end
