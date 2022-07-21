#import "RootOptionsController.h"
#import "VideoOptionsController.h"
#import "OverlayOptionsController.h"
#import "TabBarOptionsController.h"
#import "CreditsController.h"
#import "ShortsOptionsController.h"
#import "RebornSettingsController.h"
#import "DownloadsController.h"
#import "SponsorBlockOptionsController.h"
#import "OtherOptionsController.h"
#import "ChangelogsController.h"
#import "PictureInPictureOptionsController.h"
#import "../JailbreakDetection/JailbreakDetection.h"
#import "../TheosLinuxFix.h"
#import "../iOS15Fix.h"

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

@interface RootOptionsController ()
- (void)setupRootOptionsControllerView;
@end

@implementation RootOptionsController

- (void)loadView {
	[super loadView];
    [self setupRootOptionsControllerView];

    self.title = @"YouTube Reborn 设置";

    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done)];
    self.navigationItem.leftBarButtonItem = doneButton;

    UIBarButtonItem *applyButton = [[UIBarButtonItem alloc] initWithTitle:@"应用" style:UIBarButtonItemStylePlain target:self action:@selector(apply)];
    self.navigationItem.rightBarButtonItem = applyButton;

	if (@available(iOS 15.0, *)) {
    	[self.tableView setSectionHeaderTopPadding:0.0f];
	}
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }
    if (section == 1) {
        if ([JailbreakDetection isJailbroken]) {
            return 2;
        } else {
            return 1;
        }
    }
    if (section == 2) {
        return 8;
    }
    if (section == 3) {
        return 3;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"RootTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        cell.textLabel.adjustsFontSizeToFitWidth = true;
        if (@available(iOS 13.0, *)) {
            if (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleLight) {
                cell.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
                cell.textLabel.textColor = [UIColor blackColor];
            } else {
                cell.backgroundColor = [UIColor colorWithRed:0.110 green:0.110 blue:0.118 alpha:1.0];
                cell.textLabel.textColor = [UIColor whiteColor];
            }
        } else {
            cell.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
            cell.textLabel.textColor = [UIColor blackColor];
        }
        if (indexPath.section == 0) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            if (indexPath.row == 0) {
                cell.textLabel.text = @"捐赠";
            }
            if (indexPath.row == 1) {
                cell.textLabel.text = @"Discord";
            }
        }
        if (indexPath.section == 1) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            if (indexPath.row == 0) {
                cell.textLabel.text = @"浏览下载记录";
            }
            if (indexPath.row == 1) {
                cell.textLabel.text = @"在Filza中查看下载记录";
            }
        }
        if (indexPath.section == 2) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            if (indexPath.row == 0) {
                cell.textLabel.text = @"视频选项";
            }
            if (indexPath.row == 1) {
                cell.textLabel.text = @"播放界面选项";
            }
            if (indexPath.row == 2) {
                cell.textLabel.text = @"导航栏选项";
            }
            if (indexPath.row == 3) {
                cell.textLabel.text = @"颜色选项";
            }
            if (indexPath.row == 4) {
                cell.textLabel.text = @"画中画选项";
            }
            if (indexPath.row == 5) {
                cell.textLabel.text = @"Shorts(短视频)";
            }
            if (indexPath.row == 6) {
                cell.textLabel.text = @"禁用赞助商选项(Beta)";
            }
            if (indexPath.row == 7) {
                cell.textLabel.text = @"其他选项";
            }
        }
        if (indexPath.section == 3) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            if (indexPath.row == 0) {
                cell.textLabel.text = @"Reborn设置";
            }
            if (indexPath.row == 1) {
                cell.textLabel.text = @"更新日志";
            }
            if (indexPath.row == 2) {
                cell.textLabel.text = @"开发者";
            }
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.patreon.com/lillieweeb"] options:@{} completionHandler:nil];
        }
        if (indexPath.row == 1) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://repo.lillieh.gay/discord/"] options:@{} completionHandler:nil];
        }
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            DownloadsController *downloadsController = [[DownloadsController alloc] init];
            UINavigationController *downloadsControllerView = [[UINavigationController alloc] initWithRootViewController:downloadsController];
            downloadsControllerView.modalPresentationStyle = UIModalPresentationFullScreen;

            [self presentViewController:downloadsControllerView animated:YES completion:nil];
        }
        if (indexPath.row == 1) {
            NSFileManager *fm = [[NSFileManager alloc] init];
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
            NSString *documentsDirectory = [paths objectAtIndex:0];
            NSString *content = @"Filza Check";
            NSData *fileContents = [content dataUsingEncoding:NSUTF8StringEncoding];
            NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"FilzaCheck.txt"];
            [fm createFileAtPath:filePath contents:fileContents attributes:nil];
            NSString *path = [NSString stringWithFormat:@"filza://view%@/FilzaCheck.txt", documentsDirectory];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:path] options:@{} completionHandler:nil];
        }
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            VideoOptionsController *videoOptionsController = [[VideoOptionsController alloc] initWithStyle:UITableViewStyleGrouped];
            UINavigationController *videoOptionsControllerView = [[UINavigationController alloc] initWithRootViewController:videoOptionsController];
            videoOptionsControllerView.modalPresentationStyle = UIModalPresentationFullScreen;

            [self presentViewController:videoOptionsControllerView animated:YES completion:nil];
        }
        if (indexPath.row == 1) {
            OverlayOptionsController *overlayOptionsController = [[OverlayOptionsController alloc] initWithStyle:UITableViewStyleGrouped];
            UINavigationController *overlayOptionsControllerView = [[UINavigationController alloc] initWithRootViewController:overlayOptionsController];
            overlayOptionsControllerView.modalPresentationStyle = UIModalPresentationFullScreen;

            [self presentViewController:overlayOptionsControllerView animated:YES completion:nil];
        }
        if (indexPath.row == 2) {
            TabBarOptionsController *tabBarOptionsController = [[TabBarOptionsController alloc] initWithStyle:UITableViewStyleGrouped];
            UINavigationController *tabBarOptionsControllerView = [[UINavigationController alloc] initWithRootViewController:tabBarOptionsController];
            tabBarOptionsControllerView.modalPresentationStyle = UIModalPresentationFullScreen;

            [self presentViewController:tabBarOptionsControllerView animated:YES completion:nil];
        }
        if (indexPath.row == 3) {
            if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"13.0")) {
                HBColorPickerViewController *alderisViewController = [[HBColorPickerViewController alloc] init];
                alderisViewController.delegate = self;
                alderisViewController.popoverPresentationController.sourceView = self.view;
                alderisViewController.popoverPresentationController.sourceRect = self.view.bounds;
                alderisViewController.popoverPresentationController.permittedArrowDirections = 0;

                NSData *colorData = [[NSUserDefaults standardUserDefaults] objectForKey:@"kYTRebornColourOptionsVThree"];
                NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingFromData:colorData error:nil];
                [unarchiver setRequiresSecureCoding:NO];
                UIColor *colour = [unarchiver decodeObjectForKey:NSKeyedArchiveRootObjectKey];
                HBColorPickerConfiguration *configuration = [[HBColorPickerConfiguration alloc] initWithColor:colour];
                configuration.supportsAlpha = NO;

                alderisViewController.configuration = configuration;
                [self presentViewController:alderisViewController animated:YES completion:nil];
            } else {
                UIAlertController *alertError = [UIAlertController alertControllerWithTitle:@"提示" message:@"颜色选项目前不支持iOS 12, 它只支持iOS 13+" preferredStyle:UIAlertControllerStyleAlert];

                [alertError addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                }]];

                [self presentViewController:alertError animated:YES completion:nil];
            }
        }
        if (indexPath.row == 4) {
            if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"15.0")) {
                PictureInPictureOptionsController *pictureInPictureOptionsController = [[PictureInPictureOptionsController alloc] initWithStyle:UITableViewStyleGrouped];
                UINavigationController *pictureInPictureOptionsControllerView = [[UINavigationController alloc] initWithRootViewController:pictureInPictureOptionsController];
                pictureInPictureOptionsControllerView.modalPresentationStyle = UIModalPresentationFullScreen;

                [self presentViewController:pictureInPictureOptionsControllerView animated:YES completion:nil];
            } else {
                UIAlertController *alertError = [UIAlertController alertControllerWithTitle:@"提示" message:@"画中画选项只支持iOS 15+" preferredStyle:UIAlertControllerStyleAlert];

                [alertError addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                }]];

                [self presentViewController:alertError animated:YES completion:nil];
            }
        }
        if (indexPath.row == 5) {
            ShortsOptionsController *shortsOptionsController = [[ShortsOptionsController alloc] initWithStyle:UITableViewStyleGrouped];
            UINavigationController *shortsOptionsControllerView = [[UINavigationController alloc] initWithRootViewController:shortsOptionsController];
            shortsOptionsControllerView.modalPresentationStyle = UIModalPresentationFullScreen;

            [self presentViewController:shortsOptionsControllerView animated:YES completion:nil];
        }
        if (indexPath.row == 6) {
            SponsorBlockOptionsController *sponsorBlockOptionsController = [[SponsorBlockOptionsController alloc] initWithStyle:UITableViewStyleGrouped];
            UINavigationController *sponsorBlockOptionsControllerView = [[UINavigationController alloc] initWithRootViewController:sponsorBlockOptionsController];
            sponsorBlockOptionsControllerView.modalPresentationStyle = UIModalPresentationFullScreen;

            [self presentViewController:sponsorBlockOptionsControllerView animated:YES completion:nil];
        }
        if (indexPath.row == 7) {
            OtherOptionsController *otherOptionsController = [[OtherOptionsController alloc] initWithStyle:UITableViewStyleGrouped];
            UINavigationController *otherOptionsControllerView = [[UINavigationController alloc] initWithRootViewController:otherOptionsController];
            otherOptionsControllerView.modalPresentationStyle = UIModalPresentationFullScreen;

            [self presentViewController:otherOptionsControllerView animated:YES completion:nil];
        }
    }
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            RebornSettingsController *rebornSettingsController = [[RebornSettingsController alloc] initWithStyle:UITableViewStyleGrouped];
            UINavigationController *rebornSettingsControllerView = [[UINavigationController alloc] initWithRootViewController:rebornSettingsController];
            rebornSettingsControllerView.modalPresentationStyle = UIModalPresentationFullScreen;

            [self presentViewController:rebornSettingsControllerView animated:YES completion:nil];
        }
        if (indexPath.row == 1) {
            ChangelogsController *changelogsController = [[ChangelogsController alloc] init];

            [self presentViewController:changelogsController animated:YES completion:nil];
        }
        if (indexPath.row == 2) {
            CreditsController *creditsController = [[CreditsController alloc] initWithStyle:UITableViewStyleGrouped];
            UINavigationController *creditsControllerView = [[UINavigationController alloc] initWithRootViewController:creditsController];
            creditsControllerView.modalPresentationStyle = UIModalPresentationFullScreen;

            [self presentViewController:creditsControllerView animated:YES completion:nil];
        }
    }
}

- (CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 3) {
        return 50;
    }
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if (section == 3) {
        return @"Version: 3.2.0 (Beta)";
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
    if (@available(iOS 13.0, *)) {
        if (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleLight) {
            view.tintColor = [UIColor colorWithRed:0.949 green:0.949 blue:0.969 alpha:1.0];
        } else {
            view.tintColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
        }
    } else {
        view.tintColor = [UIColor colorWithRed:0.949 green:0.949 blue:0.969 alpha:1.0];
    }
    UITableViewHeaderFooterView *footer = (UITableViewHeaderFooterView *)view;
    [footer.textLabel setTextColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"tableSection"]]];
    [footer.textLabel setFont:[UIFont systemFontOfSize:14]];
    footer.textLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)colorPicker:self didAcceptColor:(UIColor *)colour {
    NSData *colorData = [NSKeyedArchiver archivedDataWithRootObject:colour requiringSecureCoding:nil error:nil];
    [[NSUserDefaults standardUserDefaults] setObject:colorData forKey:@"kYTRebornColourOptionsVThree"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    [self setupRootOptionsControllerView];
    [self.tableView reloadData];
}

@end

@implementation RootOptionsController (Privates)

- (void)done {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)apply {
    exit(0);
}

- (void)setupRootOptionsControllerView {
    if (@available(iOS 13.0, *)) {
        if (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleLight) {
            self.view.backgroundColor = [UIColor colorWithRed:0.949 green:0.949 blue:0.969 alpha:1.0];
            [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
            self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
        } else {
            self.view.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
            [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
            self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
        }
    } else {
        self.view.backgroundColor = [UIColor colorWithRed:0.949 green:0.949 blue:0.969 alpha:1.0];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
        self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    }
}

@end
