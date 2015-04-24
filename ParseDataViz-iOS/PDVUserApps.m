#import <objc/runtime.h>
#import "PDVUserApps.h"
#import "PDVApp.h"

@interface PDVUserApps ()

@property (strong, nonatomic) NSArray *apps;

@end

@implementation PDVUserApps

- (void)addApp:(PDVApp *)app {
    NSMutableArray *apps = [NSMutableArray arrayWithArray:self.apps];
    [apps addObject:app];
    self.apps = [NSArray arrayWithArray:apps];
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (!self) {
        return self;
    }
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    for (NSUInteger i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        NSString *key = [NSString stringWithUTF8String:property_getName(property)];
        [self setValue:[decoder decodeObjectForKey:key] forKey:key];
    }
    free(properties);
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    for (NSUInteger i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        NSString *key = [NSString stringWithUTF8String:property_getName(property)];
        [coder encodeObject:[self valueForKey:key] forKey:key];
    }
    free(properties);
}

@end
