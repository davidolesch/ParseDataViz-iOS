#import "PDVDataClient.h"
#import <AFNetworking/AFHTTPRequestOperationManager.h>

@implementation PDVDataClient

- (void)fetchColumnReportsForAppID:(NSString *)appID andRESTKey:(NSString *)RESTKey andClassName:(NSString *)className withSuccess:(void (^)(NSArray *))successBlock andFailure:(void (^)(NSString * errorMessage))failureBlock {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializerWithWritingOptions:NSJSONWritingPrettyPrinted];
    
    [manager.requestSerializer setValue:appID forHTTPHeaderField:@"X-Parse-Application-Id"];
    [manager.requestSerializer setValue:RESTKey forHTTPHeaderField:@"X-Parse-REST-API-Key"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSDictionary *requestParameters = @{@"className": className, @"numberOfDays": @(1)};
    
    [manager POST:@"https://api.parse.com/1/functions/topDistinctValues" parameters:requestParameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (successBlock) {
            NSArray *columns = responseObject[@"result"];
            successBlock(columns);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failureBlock) {
            NSString *errorMessage = [NSString stringWithFormat:@"%s",(char *)[error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] bytes]];
            failureBlock(errorMessage);
        }
    }];
}

@end
