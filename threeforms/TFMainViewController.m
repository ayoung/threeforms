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
#import "TFBCArticleView.h"

@implementation TFMainViewController
{
    UIScrollView *_leftScrollView;
    UIScrollView *_centerScrollView;
    UIScrollView *_rightScrollView;
    TFBCArticleView *_leftContentView;
    TFBCArticleView *_centerContentView;
    TFBCArticleView *_rightContentView;
    TFContentScrollView *_contentScrollView;
    NSNumber *_selectedArticleNumber;
}


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
    
    _leftContentView = [[TFBCArticleView alloc] init];
    _centerContentView = [[TFBCArticleView alloc] init];
    _rightContentView = [[TFBCArticleView alloc] init];
    
    [self.view addSubview:_contentScrollView];
    
    [_contentScrollView addSubview:_leftScrollView];
    [_contentScrollView addSubview:_centerScrollView];
    [_contentScrollView addSubview:_rightScrollView];
    
    [_leftScrollView addSubview:_leftContentView];
    [_centerScrollView addSubview:_centerContentView];
    [_rightScrollView addSubview:_rightContentView];
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
    
    _contentScrollView = nil;
    _leftScrollView	 = nil;
    _centerScrollView = nil;
    _rightScrollView = nil;
    _leftContentView = nil;
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
    _selectedArticleNumber = [[notification userInfo] valueForKey:@"article"];
    [self loadArticle];
}

- (void) loadArticle
{
    NSMutableArray *articles = [TFDataAccess getArticlesList];
    TFArticle *leftArticle;
    TFArticle *centerArticle;
    TFArticle *rightArticle;
    
    // first article selected
    if ([_selectedArticleNumber integerValue] == 0) {
        leftArticle = [articles objectAtIndex:[_selectedArticleNumber integerValue]];
        centerArticle = [articles objectAtIndex:[_selectedArticleNumber integerValue] + 1];
        rightArticle = [articles objectAtIndex:[_selectedArticleNumber integerValue] + 2];
    }
    // last article selected
    else if([_selectedArticleNumber integerValue] == [articles count]) {
        leftArticle = [articles objectAtIndex:[_selectedArticleNumber integerValue] - 2];
        centerArticle = [articles objectAtIndex:[_selectedArticleNumber integerValue] - 1];
        rightArticle = [articles objectAtIndex:[_selectedArticleNumber integerValue]];
    }
    // something in the middle selected
    else {
        leftArticle = [articles objectAtIndex:[_selectedArticleNumber integerValue] - 1];
        centerArticle = [articles objectAtIndex:[_selectedArticleNumber integerValue]];
        rightArticle = [articles objectAtIndex:[_selectedArticleNumber integerValue] + 1];
    }
    
    NSLog(@"Article Selected: %@", [centerArticle title]);

    [_leftContentView loadWithArticle:leftArticle];
    [_leftContentView setFrame:CGRectMake(0, 0, 320, 460)];
    
    [_centerContentView loadWithArticle:centerArticle];
    [_centerContentView setFrame:CGRectMake(0, 0, 320, 460)];
    
    [_rightContentView loadWithArticle:rightArticle];
    [_rightContentView setFrame:CGRectMake(0, 0, 320, 460)];
}

@end
