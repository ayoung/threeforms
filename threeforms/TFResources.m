//
//  TFResources.m
//  threeforms
//
//  Created by Andrew Young on 7/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TFResources.h"

@implementation TFResources

+ (NSString*) pathForXImage {
    return [[NSBundle mainBundle] pathForResource:@"X" ofType:@"png"];
}

+ (NSString*) pathForContentDb {
    return [[NSBundle mainBundle] pathForResource:@"content" ofType:@"db3"];
}

@end
