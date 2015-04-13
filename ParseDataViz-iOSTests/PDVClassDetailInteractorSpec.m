#import <Foundation/Foundation.h>
#import <Specta.h>
#define EXP_SHORTHAND
#import "Expecta.h"
#import <OCMock.h>
#import <OHHTTPStubs.h>

#import "PDVClassDetailInteractor.h"
#import "PDVClassDetailPresenter.h"

SpecBegin(PDVClassDetailInteractor)

__block OCMockObject *mock;
__block PDVClassDetailInteractor *interactor;

describe(@"Interactor", ^{
    beforeEach(^{
        NSArray *apps = @[@{@"appName": @"0 classes", @"appID":@"appID", @"RESTKey":@"RESTKey", @"classes":@[]},@{@"appName": @"1 class", @"appID":@"appID", @"RESTKey":@"RESTKey", @"classes":@[@"1st class"]},@{@"appName": @"2 classes", @"appID":@"appID", @"RESTKey":@"RESTKey", @"classes":@[@"1st class", @"2nd class"]}];
        PDVDataManager *dataManager = [[PDVDataManager alloc] initWithApps:apps];
        interactor = [[PDVClassDetailInteractor alloc] initWithDataManager:dataManager];
    });
    context(@"if data is found", ^{
        beforeAll(^{
            [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                return [request.URL.path isEqualToString:@"/1/functions/topDistinctValues"];
            } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                NSBundle *bundle = [NSBundle bundleForClass:[self class]];
                return [OHHTTPStubsResponse responseWithFileAtPath:[bundle pathForResource:@"topDistinctValues" ofType:@"json"] statusCode:200 headers:@{@"Content-Type": @"application/json"}];
            }];
        });
        it(@"update the class column report when one is requested", ^{
            mock = [OCMockObject partialMockForObject:interactor];
            [[[mock expect] presenter] updateClassColumnReport:[OCMArg any]];
            [interactor requestClassColumnReportForAppName:@"1 class" andClassName:@"1st class"];
            [mock verifyWithDelay:1];
        });
        afterAll(^{
            [OHHTTPStubs removeAllStubs];
        });
    });
    context(@"if data is not found", ^{
        beforeAll(^{
            [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                return [request.URL.path isEqualToString:@"/1/functions/topDistinctValues"];
            } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
                return [OHHTTPStubsResponse responseWithData:nil statusCode:500 headers:nil];
            }];
        });
        it(@"update the class column report with failure message when one is requested", ^{
            mock = [OCMockObject partialMockForObject:interactor];
            [[[mock expect] presenter] updateClassColumnReportErrorMessage:[OCMArg any]];
            [interactor requestClassColumnReportForAppName:@"1 class" andClassName:@"1st class"];
            [mock verifyWithDelay:1];
        });
        afterAll(^{
            [OHHTTPStubs removeAllStubs];
        });
    });
});

SpecEnd
