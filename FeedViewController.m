//
//  FeedViewController.m
//  Week Two Homework
//
//  Created by Tim Collins on 6/22/14.
//  Copyright (c) 2014 Tim Collins. All rights reserved.
//

#import "FeedViewController.h"

@interface FeedViewController ()
-(void)showFeed;
- (IBAction)statusUpdate:(id)sender;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityLoading;
@property (weak, nonatomic) IBOutlet UIImageView *feed;
@end

@implementation FeedViewController

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
    [self performSelector:@selector(showFeed) withObject:nil afterDelay:2];
    
    [super viewDidLoad];
    self.feed.alpha = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showFeed {
    self.activityLoading.alpha = 0;
    self.feed.alpha = 1;
    
}

- (IBAction)statusUpdate:(id)sender {
}

@end
