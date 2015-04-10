#import "PDVDataManager.h"
#import "PDVDataClient.h"

@interface PDVDataManager ()

@property (strong, nonatomic) NSArray *apps;
@property (strong, nonatomic) PDVDataClient *dataClient;

@end

@implementation PDVDataManager

- (instancetype)init {
    return [self initWithApps:@[@{@"appName": @"Free2go", @"appID":@"<!--Your-app-ID-->", @"RESTKey":@"<!--Your-REST-key-->", @"classes":@[@"Reservation"]}]];
}

- (instancetype)initWithApps:(NSArray *)apps {
    if ((self = [super init])) {
        _apps = apps;
        _dataClient = [[PDVDataClient alloc] init];
    }
    return self;
}

- (NSDictionary *)appDictionaryForAppName:(NSString *)appName {
    NSPredicate *appNamePredicate = [NSPredicate predicateWithFormat:@"appName MATCHES[cd] %@",appName];
    return [self.apps filteredArrayUsingPredicate:appNamePredicate].firstObject;
}

- (NSArray *)allAppNames {
    NSMutableArray *appNames = [NSMutableArray array];
    for (NSDictionary *app in self.apps) {
        [appNames addObject:app[@"appName"]];
    }
    return [NSArray arrayWithArray:appNames];
}

- (NSArray *)allClassNamesForAppName:(NSString *)appName {
    NSDictionary *app = [self appDictionaryForAppName:appName];
    return [NSArray arrayWithArray:app[@"classes"]];
}

- (NSString *)appIDForAppName:(NSString *)appName {
    NSDictionary *app = [self appDictionaryForAppName:appName];
    return app[@"appID"];
}

- (NSString *)RESTKeyForAppName:(NSString *)appName {
    NSDictionary *app = [self appDictionaryForAppName:appName];
    return app[@"RESTKey"];
}

- (void)findColumnsForAppName:(NSString *)appName andClassName:(NSString *)className withSuccess:(void (^)(NSArray *))successBlock andFailure:(void (^)(NSString *errorMessage))failureBlock {
    [self.dataClient fetchColumnReportsForAppID:[self appIDForAppName:appName] andRESTKey:[self RESTKeyForAppName:appName] andClassName:className withSuccess:successBlock andFailure:failureBlock];
}

@end
