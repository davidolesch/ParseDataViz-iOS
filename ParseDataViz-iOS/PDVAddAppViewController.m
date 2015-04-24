#import "PDVAddAppViewController.h"

@interface PDVAddAppViewController ()

@property (weak, nonatomic) IBOutlet UITextField *appNameTextField;

@end

@implementation PDVAddAppViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Add an App";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(tappedCancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(tappedSave)];
}

- (void)tappedCancel {
    [self.navigationController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)tappedSave {
    [self.presenter saveAppNamed:self.appNameTextField.text];
}

- (void)appWasAdded {
    [self.navigationController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
