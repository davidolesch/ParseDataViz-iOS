#import <Foundation/Foundation.h>

@interface PDVDataManager : NSObject

@property (strong, nonatomic) NSDictionary *dataDictionary;

- (instancetype)initWithDictionary:(NSDictionary *)dataDictionary;

@end
