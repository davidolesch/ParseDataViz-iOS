#import "PDVDataPersistence.h"

@interface PDVDataPersistence ()

@property (strong, nonatomic) PDVUserApps *userApps;

@end

@implementation PDVDataPersistence

+ (PDVDataPersistence *)sharedInstance {
    static dispatch_once_t  onceToken;
    static PDVDataPersistence *sharedInstance;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[PDVDataPersistence alloc] init];
    });
    return sharedInstance;
}

- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (id)init {
    self = [super init];
    if (self != nil)
    {
        NSURL *dataFileURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"UserApps"];
        if ([[NSFileManager defaultManager] fileExistsAtPath:[dataFileURL path]])
        {
            // saved file exists, load it's content from that path
            _userApps = [NSKeyedUnarchiver unarchiveObjectWithFile:[dataFileURL path]];
        }
        else
        {
            _userApps = [[PDVUserApps alloc] init];
        }
    }
    return self;
}

- (void)save
{
    NSURL *dataFileURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"UserApps"];
    [NSKeyedArchiver archiveRootObject:self.userApps toFile:[dataFileURL path]];
}

- (void)addApp:(NSDictionary *)app {
    [self.userApps addApp:app];
    [self save];
}

- (void)clearUserApps {
    NSURL *dataFileURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"UserApps"];
    if (dataFileURL) {
        NSError *error = nil;
        [[NSFileManager defaultManager] removeItemAtURL:dataFileURL error:&error];
        if (error) {
            NSLog(@"Error: %@",error.localizedDescription);
        }
        else {
            _userApps = [[PDVUserApps alloc] init];
        }
    }
}

- (NSArray *)allApps {
    return [self.userApps apps];
}

@end
