#import "PDVDataManager.h"
#import "PDVDataClient.h"
#import "PDVDataPersistence.h"
#import "PDVApp.h"

@interface PDVDataManager ()

@property (strong, nonatomic) NSArray *apps;
@property (strong, nonatomic) PDVDataClient *dataClient;

@end

@implementation PDVDataManager

- (instancetype)init {
    return [self initWithApps:[[PDVDataPersistence sharedInstance] allApps]];
}

- (instancetype)initWithApps:(NSArray *)apps {
    if ((self = [super init])) {
        _apps = apps;
        _dataClient = [[PDVDataClient alloc] init];
    }
    return self;
}

- (PDVApp *)appForAppName:(NSString *)appName {
    NSPredicate *appNamePredicate = [NSPredicate predicateWithFormat:@"name MATCHES[cd] %@",appName];
    return [self.apps filteredArrayUsingPredicate:appNamePredicate].firstObject;
}

- (NSArray *)allAppNames {
    NSMutableArray *appNames = [NSMutableArray array];
    for (PDVApp *app in self.apps) {
        [appNames addObject:app.name];
    }
    return [NSArray arrayWithArray:appNames];
}

- (NSArray *)allClassNamesForAppName:(NSString *)appName {
    PDVApp *app = [self appForAppName:appName];
    return app.classes;
}

- (NSString *)appIDForAppName:(NSString *)appName {
    PDVApp *app = [self appForAppName:appName];
    return app.appID;
}

- (NSString *)RESTKeyForAppName:(NSString *)appName {
    PDVApp *app = [self appForAppName:appName];
    return app.RESTKey;
}

- (void)addAppNamed:(NSString *)appName withAppID:(NSString *)appID andRESTKey:(NSString *)RESTKey{
    PDVApp *app = [[PDVApp alloc] initWithName:appName appId:appID RESTKey:RESTKey andClasses:@[@"Reservation"]];
    [[PDVDataPersistence sharedInstance] addApp:app];
}

- (void)findColumnsForAppName:(NSString *)appName andClassName:(NSString *)className withSuccess:(void (^)(NSArray *))successBlock andFailure:(void (^)(NSString *errorMessage))failureBlock {
    [self.dataClient fetchColumnReportsForAppID:[self appIDForAppName:appName] andRESTKey:[self RESTKeyForAppName:appName] andClassName:className withSuccess:successBlock andFailure:failureBlock];
}

@end
