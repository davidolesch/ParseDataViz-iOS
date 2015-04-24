#import <Foundation/Foundation.h>

@interface PDVApp : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *appID;
@property (strong, nonatomic) NSString *RESTKey;
@property (strong, nonatomic) NSArray *classes;

- (instancetype)initWithName:(NSString *)name appId:(NSString *)appID RESTKey:(NSString *)RESTKey andClasses:(NSArray *)classes;

@end
