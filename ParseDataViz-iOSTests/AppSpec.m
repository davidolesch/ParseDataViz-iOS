#import <Specta.h>
#import <KIF.h>
#import <OHHTTPStubs.h>

#import "PDVApp.h"
#import "PDVAppDelegate+Testing.h"
#import "PDVAppWireframe+Testing.h"
#import "PDVDataManager+Testing.h"

SpecBegin(App)

describe(@"App/Class list navigation", ^{
    beforeAll(^{
        PDVAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        appDelegate.appWireframe.dataManager.apps = @[[[PDVApp alloc] initWithName:@"0 classes" appId:@"appID" RESTKey:@"RESTKey" andClasses:@[]], [[PDVApp alloc] initWithName:@"1 class" appId:@"appID" RESTKey:@"RESTKey" andClasses:@[@"1st class"]], [[PDVApp alloc] initWithName:@"2 classes" appId:@"appID" RESTKey:@"RESTKey" andClasses:@[@"1st class", @"2nd class"]]];
        [appDelegate.appWireframe.appListViewController.presenter.interactor requestAppsList];
        
        [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
            return [request.URL.path isEqualToString:@"/1/functions/topDistinctValues"];
        } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
            NSBundle *bundle = [NSBundle bundleForClass:[self class]];
            return [OHHTTPStubsResponse responseWithFileAtPath:[bundle pathForResource:@"topDistinctValues" ofType:@"json"] statusCode:200 headers:@{@"Content-Type": @"application/json"}];
        }];
    });
    it(@"should show alert view when the selected app has zero classes", ^{
        [tester tapViewWithAccessibilityLabel:@"0 classes"];
        [tester waitForViewWithAccessibilityLabel:@"No classes found"];
        
        [tester tapViewWithAccessibilityLabel:@"Ok"];
    });
    it(@"should navigate straight to the class when an app has only one class", ^{
        [tester tapViewWithAccessibilityLabel:@"1 class"];
        [tester waitForViewWithAccessibilityLabel:@"1st class"];
        
        [tester tapViewWithAccessibilityLabel:@"Apps"];
    });
    it(@"should navigate to a class through a list of classes when more than one exists", ^{
        [tester tapViewWithAccessibilityLabel:@"2 classes"];
        [tester waitForViewWithAccessibilityLabel:@"Classes"];
        [tester tapViewWithAccessibilityLabel:@"2nd class"];
        [tester waitForViewWithAccessibilityLabel:@"2nd class"];
        
        [tester tapViewWithAccessibilityLabel:@"Classes"];
        [tester tapViewWithAccessibilityLabel:@"Apps"];
    });
});

SpecEnd