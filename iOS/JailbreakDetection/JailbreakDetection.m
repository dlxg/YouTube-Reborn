#import "JailbreakDetection.h"

@implementation JailbreakDetection

+ (BOOL)isJailbroken {

    #if !(TARGET_IPHONE_SIMULATOR)

    // fopen Check

    FILE *file;
    file = fopen("/Applications/Cydia.app", "r");
    if (file) {
        fclose(file);
        return YES;
    }
    file = fopen("/Applications/Sileo.app", "r");
    if (file) {
        fclose(file);
        return YES;
    }
    file = fopen("/Applications/Zebra.app", "r");
    if (file) {
        fclose(file);
        return YES;
    }
    file = fopen("/Applications/Installer.app", "r");
    if (file) {
        fclose(file);
        return YES;
    }
    file = fopen("/Applications/Saily.app", "r");
    if (file) {
        fclose(file);
        return YES;
    }
    file = fopen("/Library/MobileSubstrate/MobileSubstrate.dylib", "r");
    if (file) {
        fclose(file);
        return YES;
    }
    file = fopen("/bin/bash", "r");
    if (file) {
        fclose(file);
        return YES;
    }
    file = fopen("/usr/sbin/sshd", "r");
    if (file) {
        fclose(file);
        return YES;
    }
    file = fopen("/etc/apt", "r");
    if (file) {
        fclose(file);
        return YES;
    }
    file = fopen("/usr/bin/ssh", "r");
    if (file) {
        fclose(file);
        return YES;
    }
    file = fopen("/var/binpack/Applications/loader.app", "r");
    if (file) {
        fclose(file);
        return YES;
    }

    // NSFileManager Check
    
    NSFileManager *fileManager = [NSFileManager defaultManager];

    if ([fileManager fileExistsAtPath:@"/Applications/Cydia.app"]) {
        return YES;
    } else if ([fileManager fileExistsAtPath:@"/Applications/Sileo.app"]) {
        return YES;
    } else if ([fileManager fileExistsAtPath:@"/Applications/Zebra.app"]) {
        return YES;
    } else if ([fileManager fileExistsAtPath:@"/Applications/Installer.app"]) {
        return YES;
    } else if ([fileManager fileExistsAtPath:@"/Applications/Saily.app"]) {
        return YES;
    } else if ([fileManager fileExistsAtPath:@"/Library/MobileSubstrate/MobileSubstrate.dylib"]) {
        return YES;
    } else if ([fileManager fileExistsAtPath:@"/bin/bash"]) {
        return YES;
    } else if ([fileManager fileExistsAtPath:@"/usr/sbin/sshd"]) {
        return YES;
    } else if ([fileManager fileExistsAtPath:@"/etc/apt"]) {
        return YES;
    } else if ([fileManager fileExistsAtPath:@"/usr/bin/ssh"]) {
        return YES;
    }

    // Write Out Of Sandbox Check
    
    NSError *error = nil;
    NSString *string = @".";
    [string writeToFile:@"/private/jailbreak.txt" atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (!error) {
        [fileManager removeItemAtPath:@"/private/jailbreak.txt" error:nil];
        return YES;
    }

    // Url Scheme Check
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://"]]) {
        return YES;
    }
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"sileo://"]]) {
        return YES;
    }

    #endif

    return NO;
}

@end