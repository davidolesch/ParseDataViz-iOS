#import <Foundation/Foundation.h>
#import <Specta.h>
#define EXP_SHORTHAND
#import "Expecta.h"
#import <OCMock.h>
#import "PDVAppListInteractor.h"
#import "PDVAppListPresenter.h"

SpecBegin(PDVAppListInteractor)

__block OCMockObject *mock;
__block PDVAppListInteractor *interactor;

describe(@"Interactor", ^{
    beforeEach(^{
        NSArray *apps = @[@{@"appName": @"app name", @"appID":@"appID", @"RESTKey":@"RESTKey", @"classes":@[]}];
        PDVDataManager *dataManager = [[PDVDataManager alloc] initWithApps:apps];
        interactor = [[PDVAppListInteractor alloc] initWithDataManager:dataManager];
        mock = [OCMockObject partialMockForObject:interactor];
    });
    it(@"updates a list of apps when requested", ^{
        [[[mock expect] presenter] updateAppsList:[OCMArg isNotNil]];
        [interactor requestAppsList];
    });
    it(@"updates a list of classes when requested", ^{
        [[[mock expect] presenter] updateClasses:[OCMArg isNotNil] forAppNamed:[OCMArg isNotNil]];
        [interactor requestClassesForAppNamed:@"app name"];
    });
    after(^{
        [mock verify];
    });
});

SpecEnd
