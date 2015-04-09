#import "PDVClassListPresenter.h"

@interface PDVClassListPresenter ()

@property (strong, nonatomic) NSString *appName;

@end

@implementation PDVClassListPresenter

- (instancetype)init {
    return [self initWithAppName:@"Default App Name"];
}

- (instancetype)initWithAppName:(NSString *)appName {
    self = [super init];
    if (self) {
        _appName = appName;
    }
    return self;
}

- (void)updateView {
    [self.interactor requestClassesListForAppNamed:self.appName];
}

- (void)updateClassesList:(NSArray *)Classes {
    [self.view reloadListWithRows:Classes];
}

- (void)selectClassNamed:(NSString *)className {
    [self.appWireframe presentDetailViewForAppNamed:self.appName andClassNamed:className];
}

@end
