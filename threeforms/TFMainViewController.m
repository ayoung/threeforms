//
//  MainViewController.m
//  Reform Docs
//
//  Created by Andrew Young on 5/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TFMainViewController.h"
#import "TFDataAccess.h"
#import "TFArticle.h"

@implementation TFMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(articleSelected:) name:@"Article Selected" object:nil];
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
    _leftScrollView = [[UIScrollView alloc] init];
    _centerScrollView = [[UIScrollView alloc] init];
    _rightScrollView = [[UIScrollView alloc] init];
    
    [self.view addSubview:_contentScrollView];
    [_contentScrollView addSubview:_leftScrollView];
    [_contentScrollView addSubview:_centerScrollView];
    [_contentScrollView addSubview:_rightScrollView];
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
    
    [_leftScrollView setFrame:CGRectMake(0, 0, size.width, size.height)];
    [_centerScrollView setFrame:CGRectMake(size.width, 0, size.width, size.height)];
    [_rightScrollView setFrame:CGRectMake(size.width * 2, 0, size.width, size.height)];

    CGSize innerSize = CGSizeMake([_contentScrollView frame].size.width, 2500);
    [_leftScrollView setContentSize:innerSize];
    [_centerScrollView setContentSize:innerSize];
    [_rightScrollView setContentSize:innerSize];
    
    [_leftScrollView setBackgroundColor:[[UIColor alloc] initWithRed:1 green:0 blue:0 alpha:1]];
    [_centerScrollView setBackgroundColor:[[UIColor alloc] initWithRed:0 green:2 blue:0 alpha:1]];
    [_rightScrollView setBackgroundColor:[[UIColor alloc] initWithRed:0 green:0 blue:3 alpha:1]];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    _contentScrollView = nil;
    _leftScrollView = nil;
    _centerScrollView = nil;
    _rightScrollView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) articleSelected:(NSNotification *) notification
{
    NSNumber *articleNumber = [[notification userInfo] valueForKey:@"article"];
    [self loadArticle:articleNumber];
}

- (void) loadArticle:(NSNumber*)articleNumber
{
    NSMutableArray *articles = [TFDataAccess getArticlesList];
    TFArticle *article = [articles objectAtIndex:[articleNumber integerValue]];
    NSLog(@"Article Selected: %@", [article title]);
}

@end
