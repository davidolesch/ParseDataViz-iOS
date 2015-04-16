#import <Foundation/Foundation.h>
#define EXP_SHORTHAND
#include <Specta/Specta.h>
#include <Expecta/Expecta.h>
#include <Expecta+Snapshots/EXPMatchers+FBSnapshotTest.h>
#import <OHHTTPStubs.h>
#import "PDVClassDetailViewController.h"

SpecBegin(PDVClassDetailViewController)

__block PDVClassDetailViewController *detailViewController;

describe(@"detail view controller", ^{
    beforeAll(^{
        [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
            return [request.URL.path isEqualToString:@"/1/functions/topDistinctValues"];
        } withStubResponse:^OHHTTPStubsResponse *(NSURLRequest *request) {
            NSBundle *bundle = [NSBundle bundleForClass:[self class]];
            return [OHHTTPStubsResponse responseWithFileAtPath:[bundle pathForResource:@"topDistinctValues" ofType:@"json"] statusCode:200 headers:@{@"Content-Type": @"application/json"}];
        }];
        
        detailViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:kClassDetailViewControllerStoryboardID];
        NSArray *apps = @[@{@"appName": @"app name", @"appID":@"appID", @"RESTKey":@"RESTKey", @"classes":@[@"class name"]}];
        PDVDataManager *dataManager = [[PDVDataManager alloc] initWithApps:apps];
        
        PDVClassDetailPresenter *presenter = [[PDVClassDetailPresenter alloc] initWithAppName:@"app name" andClassName:@"class name"];
        PDVClassDetailInteractor *interactor = [[PDVClassDetailInteractor alloc] initWithDataManager:dataManager];
        
        detailViewController.presenter = presenter;
        presenter.interactor = interactor;
        interactor.presenter = presenter;
        presenter.view = detailViewController;
        
        detailViewController.view.frame = CGRectMake(0, 0, 320, 568);
    });
    it(@"loaded view matches", ^{
        UIView *view = detailViewController.view;
        waitUntil(^(DoneCallback done) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, (unsigned long) NULL), ^(void) {
                [NSThread sleepForTimeInterval:2.0];
                dispatch_async(dispatch_get_main_queue(), ^{
                    expect(view).to.haveValidSnapshot();
                    done();
                });
            });
        });
    });
    afterAll(^{
        [OHHTTPStubs removeAllStubs];
    });
});

SpecEnd
