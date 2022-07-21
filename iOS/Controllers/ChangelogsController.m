#import "ChangelogsController.h"

@interface ChangelogsController ()
@end

@implementation ChangelogsController

- (void)loadView {
	[super loadView];
    
    _rebornChangelogsWebView = [[WKWebView alloc] initWithFrame:self.view.frame];  
    [_rebornChangelogsWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://repo.lillieh.gay/changelogs/youtubereborn.html"]]];
    _rebornChangelogsWebView.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:_rebornChangelogsWebView];
}

@end