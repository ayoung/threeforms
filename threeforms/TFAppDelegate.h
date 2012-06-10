//
//  TFAppDelegate.h
//  threeforms
//
//  Created by Andrew Young on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFMainViewController.h"

@interface TFAppDelegate : UIResponder <UIApplicationDelegate> {
    @private TFMainViewController *_mainViewController;
    @private UINavigationController *_menuNavController;
}

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
