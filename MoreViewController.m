//
//  MoreViewController.m
//  Week Two Homework
//
//  Created by Tim Collins on 6/22/14.
//  Copyright (c) 2014 Tim Collins. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()
@property (weak, nonatomic) IBOutlet UIView *headerBar;

@end

@implementation MoreViewController

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
    // Do any additional setup after loading the view from its nib.
    UIImage *more = [UIImage imageNamed:@"more"];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 63,  more.size.width, more.size.height)];

    scrollView.contentSize = CGSizeMake(320, 2000);

    UIImageView *moreScrollImage = [[UIImageView alloc] initWithImage:more];
    [scrollView addSubview:moreScrollImage];
    [self.view addSubview:scrollView];
    [self.view bringSubviewToFront:self.headerBar];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
