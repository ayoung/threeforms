//
//  TFDocumentsViewController.h
//  threeforms
//
//  Created by Andrew Young on 6/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFDocumentsTableView.h"

@interface TFDocumentsViewController : UIViewController <UITableViewDataSource> {
@private TFDocumentsTableView *_tableView;
@private UIButton *_closeButton;
@private NSString *_closeImage;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

@end
