#import "YouTubeExtractor.h"

@implementation YouTubeExtractor

+ (NSMutableDictionary *)youtubeiAndroidPlayerRequest :(NSString *)videoID {
    NSMutableURLRequest *innertubeRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://www.youtube.com/youtubei/v1/player?key=AIzaSyAO_FJ2SlqU8Q4STEHLGCilw_Y9_11qcW8&prettyPrint=false"]];
    [innertubeRequest setHTTPMethod:@"POST"];
    [innertubeRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [innertubeRequest setValue:@"CONSENT=YES+" forHTTPHeaderField:@"Cookie"];
    NSString *jsonBody = [NSString stringWithFormat:@"{\"context\":{\"client\":{\"hl\":\"en\",\"clientName\":\"ANDROID\",\"clientVersion\":\"16.20\",\"playbackContext\":{\"contentPlaybackContext\":{\"html5Preference\":\"HTML5_PREF_WANTS\"}}}},\"contentCheckOk\":true,\"racyCheckOk\":true,\"videoId\":\"%@\"}", videoID];
    [innertubeRequest setHTTPBody:[jsonBody dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES]];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:innertubeRequest returningResponse:nil error:nil];
    return [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
}

+ (NSMutableDictionary *)youtubeiiOSPlayerRequest :(NSString *)videoID {
    NSMutableURLRequest *innertubeRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://www.youtube.com/youtubei/v1/player?key=AIzaSyAO_FJ2SlqU8Q4STEHLGCilw_Y9_11qcW8&prettyPrint=false"]];
    [innertubeRequest setHTTPMethod:@"POST"];
    [innertubeRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [innertubeRequest setValue:@"CONSENT=YES+" forHTTPHeaderField:@"Cookie"];
    NSString *jsonBody = [NSString stringWithFormat:@"{\"context\":{\"client\":{\"hl\":\"en\",\"clientName\":\"IOS\",\"clientVersion\":\"16.20\",\"playbackContext\":{\"contentPlaybackContext\":{\"html5Preference\":\"HTML5_PREF_WANTS\"}}}},\"contentCheckOk\":true,\"racyCheckOk\":true,\"videoId\":\"%@\"}", videoID];
    [innertubeRequest setHTTPBody:[jsonBody dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES]];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:innertubeRequest returningResponse:nil error:nil];
    return [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
}

@end