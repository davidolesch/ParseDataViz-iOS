#import "PDVDataManager.h"

@interface PDVDataManager ()

@property (strong, nonatomic) NSArray *apps;

@end

@implementation PDVDataManager

- (instancetype)init {
    return [self initWithApps:@[@{@"appName": @"Free2go", @"appID":@"<!--Your-app-ID-->", @"RESTKey":@"<!--Your-REST-key-->", @"classes":@[@"Reservation"]}]];
}

- (instancetype)initWithApps:(NSArray *)apps {
    if ((self = [super init])) {
        _apps = apps;
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

- (void)fetchColumnsForAppName:(NSString *)appName andClassName:(NSString *)className withCompletion:(void (^)(NSArray *))completionBlock {
    if (completionBlock) {
        completionBlock(@[@{@"columnName":@"accountId",@"distinctValueCount":@339,@"distinctValues":@[@{@"count":@153,@"value":@"1491493"},@{@"count":@71,@"value":@"1448074"},@{@"count":@50,@"value":@"1076870"},@{@"count":@47,@"value":@"986119"},@{@"count":@42,@"value":@"207354"},@{@"count":@41,@"value":@"1100364"},@{@"count":@40,@"value":@"918331"},@{@"count":@38,@"value":@"1478867"},@{@"count":@35,@"value":@"974045"},@{@"count":@34,@"value":@"1311175"}]},@{@"columnName":@"locationId",@"distinctValueCount":@24,@"distinctValues":@[@{@"count":@477,@"value":@"4"},@{@"count":@160,@"value":@"29"},@{@"count":@153,@"value":@"9"},@{@"count":@120,@"value":@"11"},@{@"count":@97,@"value":@"13"},@{@"count":@73,@"value":@"2"},@{@"count":@73,@"value":@"31"},@{@"count":@69,@"value":@"21"},@{@"count":@58,@"value":@"24"},@{@"count":@57,@"value":@"15"}]},@{@"columnName":@"vehicleVIN",@"distinctValueCount":@1319,@"distinctValues":@[@{@"count":@7,@"value":@"WMEEJ3BA9CK573855"},@{@"count":@4,@"value":@"WMEEJ3BA5BK458670"},@{@"count":@4,@"value":@"WMEEJ3BA0DK642918"},@{@"count":@4,@"value":@"WMEEJ3BA3DK644324"},@{@"count":@4,@"value":@"WMEEJ3BA2EK731293"},@{@"count":@4,@"value":@"WMEEJ3BAXEK762503"},@{@"count":@4,@"value":@"WMEEJ3BA3EK763119"},@{@"count":@4,@"value":@"WMEEJ3BAXFK803388"},@{@"count":@3,@"value":@"WMEEJ3BA8DK704713"},@{@"count":@3,@"value":@"WMEEJ3BA1DK628431"}]}]);
    }
}

@end
