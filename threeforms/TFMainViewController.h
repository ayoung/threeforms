//
//  MainViewController.h
//  Reform Docs
//
//  Created by Andrew Young on 5/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFContentScrollView.h"

@interface TFMainViewController : UIViewController {
    @private UIScrollView *_scrollView1;
    @private UIScrollView *_scrollView2;
    @private UIScrollView *_scrollView3;
    @private TFContentScrollView *_contentScrollView;
}

@end
