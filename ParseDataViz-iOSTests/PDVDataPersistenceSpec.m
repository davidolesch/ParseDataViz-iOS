#import <Foundation/Foundation.h>
#define EXP_SHORTHAND
#include <Specta/Specta.h>
#include <Expecta/Expecta.h>
#import "PDVDataPersistence.h"
#import "PDVApp.h"

SpecBegin(PDVDataPersistence)

describe(@"data persistence", ^{
    __block PDVDataPersistence *dataPersistence;
    __block PDVApp *app = [[PDVApp alloc] initWithName:@"app name" appId:@"appID" RESTKey:@"RESTKey" andClasses:@[@"class name"]];

    beforeEach(^{
         dataPersistence = [[PDVDataPersistence alloc] init];
        [dataPersistence clearUserApps];
    });
    it(@"can add an app", ^{
        [dataPersistence addApp:app];
        expect(dataPersistence.allApps).to.equal(@[app]);
    });
    it(@"can clear all user apps", ^{
        [dataPersistence addApp:app];
        [dataPersistence clearUserApps];
        expect(dataPersistence.allApps).to.beNil;
    });
    it(@"can remember an app between instances", ^{
        [dataPersistence addApp:app];
        dataPersistence = nil;
        dataPersistence = [[PDVDataPersistence alloc] init];
        expect(dataPersistence.allApps).to.equal(@[app]);
    });
    afterAll(^{
        [dataPersistence clearUserApps];
    });
});

SpecEnd
