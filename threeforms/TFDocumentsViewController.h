//
//  TFDocumentsViewController.h
//  threeforms
//
//  Created by Andrew Young on 6/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFDocumentsTableView.h"
#import "TFResources.h"

@interface TFDocumentsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

@end