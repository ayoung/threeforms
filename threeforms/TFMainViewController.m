//
//  MainViewController.m
//  Reform Docs
//
//  Created by Andrew Young on 5/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TFMainViewController.h"

@implementation TFMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    [super loadView];
    
    _contentScrollView = [[TFContentScrollView alloc] init];
    _scrollView1 = [[UIScrollView alloc] init];
    _scrollView2 = [[UIScrollView alloc] init];
    _scrollView3 = [[UIScrollView alloc] init];
    
    [self.view addSubview:_contentScrollView];
    [_contentScrollView addSubview:_scrollView1];
    [_contentScrollView addSubview:_scrollView2];
    [_contentScrollView addSubview:_scrollView3];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect fullFrame = CGRectMake(0, 0, 320, 460);
    CGSize size = fullFrame.size;

    [_contentScrollView setFrame:fullFrame];
    [_contentScrollView setBackgroundColor:[[UIColor alloc] initWithWhite:0 alpha:1]];
    [_contentScrollView setPagingEnabled:TRUE];
    [_contentScrollView setShowsHorizontalScrollIndicator:FALSE];
    [_contentScrollView setShowsVerticalScrollIndicator:FALSE];
    [_contentScrollView setContentSize:CGSizeMake(size.width*3, size.height)];
    
    [_scrollView1 setFrame:CGRectMake(0, 0, size.width, size.height)];
    [_scrollView2 setFrame:CGRectMake(size.width, 0, size.width, size.height)];
    [_scrollView3 setFrame:CGRectMake(size.width * 2, 0, size.width, size.height)];

    CGSize innerSize = CGSizeMake([_contentScrollView frame].size.width, 2500);
    [_scrollView1 setContentSize:innerSize];
    [_scrollView2 setContentSize:innerSize];
    [_scrollView3 setContentSize:innerSize];
    
    [_scrollView1 setBackgroundColor:[[UIColor alloc] initWithRed:1 green:0 blue:0 alpha:1]];
    [_scrollView2 setBackgroundColor:[[UIColor alloc] initWithRed:0 green:2 blue:0 alpha:1]];
    [_scrollView3 setBackgroundColor:[[UIColor alloc] initWithRed:0 green:0 blue:3 alpha:1]];
    
}

- (void)viewDidUnload
{
    _contentScrollView = NULL;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
