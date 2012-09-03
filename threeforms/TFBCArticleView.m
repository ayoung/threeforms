#import "TFBCArticleView.h"

@implementation TFBCArticleView
{
    UITextView *_articleNumLabel;
    UITextView *_titleLable;
    UITextView *_articleTextLabel;
}


- (id)init
{
    self = [super init];
    if (self) {
        _articleNumLabel = [[UITextView alloc] init];
        _titleLable = [[UITextView alloc] init];
        _articleTextLabel = [[UITextView alloc] init];
        
        [self addSubview:_articleTextLabel];
        [self addSubview:_titleLable];
        [self addSubview:_articleNumLabel];
        
        [_titleLable setEditable:NO];
        [_titleLable setBackgroundColor:[UIColor clearColor]];
        
        [_articleTextLabel setEditable:NO];
        [_articleTextLabel setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

-(void) loadWithArticle:(TFArticle*)article
{
    [_titleLable setText:article.title];
    [_articleTextLabel setText:article.text];
    
    [_titleLable setFrame:CGRectMake(10, 10, 300, 40)];
    [_articleTextLabel setFrame:CGRectMake(10, 60, 300, 60)];
    [_articleTextLabel sizeToFit];
    
}
@end
