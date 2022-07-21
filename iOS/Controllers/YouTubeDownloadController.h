#import <UIKit/UIKit.h>

@interface YouTubeDownloadController : UIViewController

@property (nonatomic, strong) NSString *downloadTitle;
@property (nonatomic, strong) NSURL *videoURL;
@property (nonatomic, strong) NSURL *audioURL;
@property (nonatomic, strong) NSURL *dualURL;
@property (nonatomic, strong) NSURL *artworkURL;
@property (nonatomic, assign) NSInteger downloadOption;

@end