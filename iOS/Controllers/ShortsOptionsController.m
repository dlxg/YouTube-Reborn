#import "ShortsOptionsController.h"
#import "../TheosLinuxFix.h"
#import "../iOS15Fix.h"

@interface ShortsOptionsController ()
- (void)setupShortsOptionsControllerView;
@end

@implementation ShortsOptionsController

- (void)loadView {
	[super loadView];
    [self setupShortsOptionsControllerView];

    self.title = @"Shorts(短视频)选项";

    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done)];
    self.navigationItem.rightBarButtonItem = doneButton;

    if (@available(iOS 15.0, *)) {
    	[self.tableView setSectionHeaderTopPadding:0.0f];
	}
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"ShortsTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        cell.textLabel.adjustsFontSizeToFitWidth = true;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
        if (indexPath.row == 0) {
            cell.textLabel.text = @"隐藏点赞按钮";
            UISwitch *hideShortsLikeButton = [[UISwitch alloc] initWithFrame:CGRectZero];
            [hideShortsLikeButton addTarget:self action:@selector(toggleHideShortsLikeButton:) forControlEvents:UIControlEventValueChanged];
            hideShortsLikeButton.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"kHideShortsLikeButton"];
            cell.accessoryView = hideShortsLikeButton;
        }
        if (indexPath.row == 1) {
            cell.textLabel.text = @"隐藏踩按钮";
            UISwitch *hideShortsDislikeButton = [[UISwitch alloc] initWithFrame:CGRectZero];
            [hideShortsDislikeButton addTarget:self action:@selector(toggleHideShortsDislikeButton:) forControlEvents:UIControlEventValueChanged];
            hideShortsDislikeButton.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"kHideShortsDislikeButton"];
            cell.accessoryView = hideShortsDislikeButton;
        }
        if (indexPath.row == 2) {
            cell.textLabel.text = @"隐藏评论按钮";
            UISwitch *hideShortsCommentsButton = [[UISwitch alloc] initWithFrame:CGRectZero];
            [hideShortsCommentsButton addTarget:self action:@selector(toggleHideShortsCommentsButton:) forControlEvents:UIControlEventValueChanged];
            hideShortsCommentsButton.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"kHideShortsCommentsButton"];
            cell.accessoryView = hideShortsCommentsButton;
        }
        if (indexPath.row == 3) {
            cell.textLabel.text = @"隐藏分享按钮";
            UISwitch *hideShortsShareButton = [[UISwitch alloc] initWithFrame:CGRectZero];
            [hideShortsShareButton addTarget:self action:@selector(toggleHideShortsShareButton:) forControlEvents:UIControlEventValueChanged];
            hideShortsShareButton.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"kHideShortsShareButton"];
            cell.accessoryView = hideShortsShareButton;
        }
        if (indexPath.row == 4) {
            cell.textLabel.text = @"隐藏更多操作按钮";
            UISwitch *hideShortsMoreActionsButton = [[UISwitch alloc] initWithFrame:CGRectZero];
            [hideShortsMoreActionsButton addTarget:self action:@selector(toggleHideShortsMoreActionsButton:) forControlEvents:UIControlEventValueChanged];
            hideShortsMoreActionsButton.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"kHideShortsMoreActionsButton"];
            cell.accessoryView = hideShortsMoreActionsButton;
        }
    }
    return cell;
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    [self setupShortsOptionsControllerView];
    [self.tableView reloadData];
}

@end

@implementation ShortsOptionsController (Privates)

- (void)done {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)setupShortsOptionsControllerView {
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

- (void)toggleHideShortsMoreActionsButton:(UISwitch *)sender {
    if ([sender isOn]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"kHideShortsMoreActionsButton"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"kHideShortsMoreActionsButton"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)toggleHideShortsLikeButton:(UISwitch *)sender {
    if ([sender isOn]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"kHideShortsLikeButton"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"kHideShortsLikeButton"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)toggleHideShortsDislikeButton:(UISwitch *)sender {
    if ([sender isOn]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"kHideShortsDislikeButton"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"kHideShortsDislikeButton"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)toggleHideShortsCommentsButton:(UISwitch *)sender {
    if ([sender isOn]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"kHideShortsCommentsButton"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"kHideShortsCommentsButton"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)toggleHideShortsShareButton:(UISwitch *)sender {
    if ([sender isOn]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"kHideShortsShareButton"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"kHideShortsShareButton"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

@end