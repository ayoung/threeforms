//
//  TFDataAccess.m
//  threeforms
//
//  Created by Andrew Young on 7/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TFDataAccess.h"
#import "FMDatabase.h"
#import "TFResources.h"

@implementation TFDataAccess

+(NSArray*) getArticlesList
{
    static NSArray *articles = nil;
    
    if (articles != nil) {
        return articles;
    }
    
    NSMutableArray *articlesList = [[NSMutableArray alloc] init];
    
    FMDatabase *db = [FMDatabase databaseWithPath:[TFResources pathForContentDb]];
    
    if (![db open]) {
        return nil;
    }
    
    FMResultSet *results = [db executeQuery:@"select number, title, text from articles order by number asc"];
    
    while ([results next]) {
        TFArticle *article = [[TFArticle alloc] init];
        [article setNumber:[results intForColumn:@"number"]];
        [article setTitle:[results stringForColumn:@"title"]];
        [article setText:[results stringForColumn:@"text"]];
        [articlesList insertObject:article atIndex:[articlesList count]];
    }
    
    articles = [NSArray arrayWithArray:articlesList];
    
    return articles;
}

@end
