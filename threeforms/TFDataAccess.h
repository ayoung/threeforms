//
//  TFDataAccess.h
//  threeforms
//
//  Created by Andrew Young on 7/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFArticle.h"

@interface TFDataAccess : NSObject

+(NSMutableArray*) getArticlesList;

@end
