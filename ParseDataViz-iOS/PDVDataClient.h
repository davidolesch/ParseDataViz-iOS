#import <Foundation/Foundation.h>

@interface PDVDataClient : NSObject

- (void)fetchColumnReportsForAppID:(NSString *)appID andRESTKey:(NSString *)RESTKey andClassName:(NSString *)className withSuccess:(void (^)(NSArray *columnReports))successBlock andFailure:(void (^)(NSString *errorMessage))failureBlock;

@end
