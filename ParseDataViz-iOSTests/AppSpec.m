#import <Specta.h>
#import <KIF.h>

SpecBegin(App)

describe(@"App/Class list navigation", ^{
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