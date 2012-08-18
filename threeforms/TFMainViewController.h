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
    @private UIScrollView *_leftScrollView;
    @private UIScrollView *_centerScrollView;
    @private UIScrollView *_rightScrollView;
    @private TFContentScrollView *_contentScrollView;
}

@end
