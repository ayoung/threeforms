//
//  TFDocumentsViewController.m
//  threeforms
//
//  Created by Andrew Young on 6/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TFDocumentsViewController.h"

@interface TFDocumentsViewController (private)
-(IBAction) closeButtonTouchUpInside:(id)sender;
@end

@implementation TFDocumentsViewController

- (id)init
{
    self = [super init];
    if (self) {
        _closeImage = [[NSBundle mainBundle] pathForResource:@"X" ofType:@"png"];
    }
    return self;
}

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
    _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _tableView = [[TFDocumentsTableView alloc] init];
    [self.view addSubview:_tableView];
    [self.view addSubview:_closeButton];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor: [[UIColor alloc] initWithWhite:0 alpha:0.85]];
    
    // setup the tableview
    [_tableView setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
    [_tableView setBackgroundColor:[UIColor clearColor]];
    [_tableView setFrame:CGRectMake(0, 0, 320, 460)];
    [_tableView setSeparatorColor:[UIColor clearColor]];
    //[_tableView setDataSource:self];
    
    // setup close button
    [_closeButton setFrame:CGRectMake(290, 10, 20, 20)];
    [_closeButton setImage:[[UIImage alloc] initWithContentsOfFile:_closeImage] forState:UIControlStateNormal];
    [_closeButton addTarget:self action:@selector(closeButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    _tableView = nil;
    _closeButton = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)closeButtonTouchUpInside:(id)sender
{
    [UIView animateWithDuration:0.3f animations:^{
        [self.view setAlpha:0];
    } completion:^(BOOL finished){
        [self.navigationController.view setHidden:true];
    }];
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

@end
