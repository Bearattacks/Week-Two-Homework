//
//  LoginViewController.m
//  Week Two Homework
//
//  Created by Tim Collins on 6/21/14.
//  Copyright (c) 2014 Tim Collins. All rights reserved.
//

#import "LoginViewController.h"
#import "FeedViewController.h"
#import "PeopleViewController.h"
#import "MessagesViewController.h"
#import "NotificationsViewController.h"
#import "MoreViewController.h"

@interface LoginViewController ()

- (IBAction)dismissKeyboard:(id)sender;
- (IBAction)emailFieldFocus:(id)sender;
- (IBAction)passwordFieldFocus:(id)sender;
- (IBAction)emailFieldEditing:(id)sender;
- (IBAction)passwordFieldEditing:(id)sender;
- (IBAction)loginbuttonTap:(id)sender;

-(void)login;

@property (weak, nonatomic) IBOutlet UIView *loginContainerView;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (nonatomic, assign, getter=isWorking) BOOL isKeyboardUp;

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
        self.loginButton.enabled = NO;
    self.activityIndicator.alpha = 0;
    self.passwordField.secureTextEntry = YES;

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissKeyboard:(id)sender {
    
    if(self.isKeyboardUp == YES) {

        [self.emailField endEditing:YES];
        [self.passwordField   endEditing:YES];
        self.isKeyboardUp = NO;

        [UIView animateWithDuration:0.25
                         animations:^{
            self.loginContainerView.frame = CGRectMake(self.loginContainerView.frame.origin.x, self.loginContainerView.frame.origin.y + 70, self.loginContainerView.frame.size.width, self.loginContainerView.frame.size.height);
        }];
    }
}

- (IBAction)emailFieldFocus:(id)sender {
    self.emailField.autocorrectionType = NO;
    if (self.isKeyboardUp == NO) {
        self.isKeyboardUp = YES;
        NSLog(@"Keyboard is up");
        [UIView animateWithDuration:0.25  animations:^{
            self.loginContainerView.frame = CGRectMake(self.loginContainerView.frame.origin.x, self.loginContainerView.frame.origin.y - 70, self.loginContainerView.frame.size.width, self.loginContainerView.frame.size.height);
        }];
    }
}

- (IBAction)passwordFieldFocus:(id)sender {
    self.passwordField.autocorrectionType = NO;
    if (self.isKeyboardUp == NO) {
        self.isKeyboardUp = YES;
        NSLog(@"Keyboard is up");
        [UIView animateWithDuration:0.25  animations:^{
            self.loginContainerView.frame = CGRectMake(self.loginContainerView.frame.origin.x, self.loginContainerView.frame.origin.y - 70, self.loginContainerView.frame.size.width, self.loginContainerView.frame.size.height);
        }];
    }
}

- (IBAction)emailFieldEditing:(id)sender {
    if(self.emailField.text.length == 0 && self.passwordField.text.length == 0) {
        self.loginButton.enabled = NO;
    } else if(self.emailField.text.length > 0 && self.passwordField.text.length > 0) {
        self.loginButton.enabled = YES;
    }

}

- (IBAction)passwordFieldEditing:(id)sender {
    if(self.emailField.text.length == 0 && self.passwordField.text.length == 0) {
        self.loginButton.enabled = NO;
    } else if(self.emailField.text.length > 0 && self.passwordField.text.length > 0) {
        self.loginButton.enabled = YES;
    }

}

- (IBAction)loginbuttonTap:(id)sender {
    self.activityIndicator.alpha = 1;
    [self performSelector:@selector(login) withObject:nil afterDelay:2];

}

-(void)login {
    self.activityIndicator.alpha = 0;
    
    if ([self.passwordField.text isEqualToString:@"password"]) {
        
        FeedViewController *vc = [[FeedViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];

        FeedViewController *viewOne = [[FeedViewController alloc] init];
        PeopleViewController *viewTwo = [[PeopleViewController alloc] init];
        MessagesViewController *viewThree = [[MessagesViewController alloc] init];
        NotificationsViewController *viewFour = [[NotificationsViewController alloc] init];
        MoreViewController *viewFive = [[MoreViewController alloc] init];
        
        UITabBarController *tabBarController = [[UITabBarController alloc] init];
        tabBarController.viewControllers = @[viewOne, viewTwo, viewThree, viewFour, viewFive];
        viewOne.tabBarItem.title = @"News Feed";
        viewTwo.tabBarItem.title = @"People";
        viewThree.tabBarItem.title = @"Messenger";
        viewFour.tabBarItem.title = @"Notifications";
        viewFive.tabBarItem.title = @"More";
        
        [self presentViewController:tabBarController animated:YES completion:nil];

    
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Password Incorrect" message:@"Try again" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        [alertView show];
    }
}

@end
