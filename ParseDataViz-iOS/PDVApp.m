#import <objc/runtime.h>
#import "PDVApp.h"

@implementation PDVApp

- (instancetype)initWithName:(NSString *)name appId:(NSString *)appID RESTKey:(NSString *)RESTKey andClasses:(NSArray *)classes {
    if ((self = [super init])) {
        _name = name;
        _appID = appID;
        _RESTKey = RESTKey;
        _classes = classes;
    }
    return self;
}

- (BOOL)isEqual:(id)object {
    if (object == self) {
        return YES;
    }
    else if ([object isKindOfClass:[self class]]) {
        unsigned int count;
        objc_property_t *properties = class_copyPropertyList([self class], &count);
        for (NSUInteger i = 0; i < count; i++) {
            objc_property_t property = properties[i];
            NSString *key = [NSString stringWithUTF8String:property_getName(property)];
            id selfValue = [self valueForKey:key];
            id objectValue = [object valueForKey:key];
            if (![objectValue isEqual:selfValue] && objectValue != selfValue) {
                return NO;
            }
        }
        free(properties);
        return YES;
    }
    return NO;
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
