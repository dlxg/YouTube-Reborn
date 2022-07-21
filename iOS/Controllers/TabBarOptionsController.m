#import "TabBarOptionsController.h"
#import "StartupPageOptionsController.h"
#import "../TheosLinuxFix.h"
#import "../iOS15Fix.h"

@interface TabBarOptionsController ()
- (void)setupTabBarOptionsControllerView;
@end

@implementation TabBarOptionsController

- (void)loadView {
	[super loadView];
    [self setupTabBarOptionsControllerView];

    self.title = @"导航栏选项";

    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done)];
    self.navigationItem.rightBarButtonItem = doneButton;

    if (@available(iOS 15.0, *)) {
    	[self.tableView setSectionHeaderTopPadding:0.0f];
	}
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return 6;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"TabBarTableViewCell";
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
            cell.textLabel.text = @"启动页面";
            if (![[NSUserDefaults standardUserDefaults] integerForKey:@"kStartupPageIntVTwo"]) {
                cell.detailTextLabel.text = @"首页";
            } else {
                int selectedTab = [[NSUserDefaults standardUserDefaults] integerForKey:@"kStartupPageIntVTwo"];
                if (selectedTab == 0) {
                    cell.detailTextLabel.text = @"首页";
                }
                if (selectedTab == 1) {
                    cell.detailTextLabel.text = @"探索";
                }
                if (selectedTab == 2) {
                    cell.detailTextLabel.text = @"Shorts";
                }
                if (selectedTab == 3) {
                    cell.detailTextLabel.text = @"订阅内容";
                }
                if (selectedTab == 4) {
                    cell.detailTextLabel.text = @"媒体库";
                }
            }
        }
        if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                cell.textLabel.text = @"隐藏标签";
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                UISwitch *hideTabBarLabels = [[UISwitch alloc] initWithFrame:CGRectZero];
                [hideTabBarLabels addTarget:self action:@selector(toggleHideTabBarLabels:) forControlEvents:UIControlEventValueChanged];
                hideTabBarLabels.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"kHideTabBarLabels"];
                cell.accessoryView = hideTabBarLabels;
            }
            if (indexPath.row == 1) {
                cell.textLabel.text = @"隐藏探索";
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                UISwitch *hideExploreTab = [[UISwitch alloc] initWithFrame:CGRectZero];
                [hideExploreTab addTarget:self action:@selector(toggleHideExploreTab:) forControlEvents:UIControlEventValueChanged];
                hideExploreTab.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"kHideExploreTab"];
                cell.accessoryView = hideExploreTab;
            }
            if (indexPath.row == 2) {
                cell.textLabel.text = @"隐藏Shorts";
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                UISwitch *hideShortsTab = [[UISwitch alloc] initWithFrame:CGRectZero];
                [hideShortsTab addTarget:self action:@selector(toggleHideShortsTab:) forControlEvents:UIControlEventValueChanged];
                hideShortsTab.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"kHideShortsTab"];
                cell.accessoryView = hideShortsTab;
            }
            if (indexPath.row == 3) {
                cell.textLabel.text = @"隐藏创建/上传 (+)";
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                UISwitch *hideUploadTab = [[UISwitch alloc] initWithFrame:CGRectZero];
                [hideUploadTab addTarget:self action:@selector(toggleHideUploadTab:) forControlEvents:UIControlEventValueChanged];
                hideUploadTab.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"kHideUploadTab"];
                cell.accessoryView = hideUploadTab;
            }
            if (indexPath.row == 4) {
                cell.textLabel.text = @"隐藏订阅";
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                UISwitch *hideSubscriptionsTab = [[UISwitch alloc] initWithFrame:CGRectZero];
                [hideSubscriptionsTab addTarget:self action:@selector(toggleHideSubscriptionsTab:) forControlEvents:UIControlEventValueChanged];
                hideSubscriptionsTab.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"kHideSubscriptionsTab"];
                cell.accessoryView = hideSubscriptionsTab;
            }
            if (indexPath.row == 5) {
                cell.textLabel.text = @"隐藏媒体库";
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                UISwitch *hideLibraryTab = [[UISwitch alloc] initWithFrame:CGRectZero];
                [hideLibraryTab addTarget:self action:@selector(toggleHideLibraryTab:) forControlEvents:UIControlEventValueChanged];
                hideLibraryTab.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"kHideLibraryTab"];
                cell.accessoryView = hideLibraryTab;
            }
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [theTableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            StartupPageOptionsController *startupPageOptionsController = [[StartupPageOptionsController alloc] initWithStyle:UITableViewStyleGrouped];
            UINavigationController *startupPageOptionsControllerView = [[UINavigationController alloc] initWithRootViewController:startupPageOptionsController];
            startupPageOptionsControllerView.modalPresentationStyle = UIModalPresentationFullScreen;

            [self presentViewController:startupPageOptionsControllerView animated:YES completion:nil];
        }
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    [self setupTabBarOptionsControllerView];
    [self.tableView reloadData];
}

@end

@implementation TabBarOptionsController (Privates)

- (void)done {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)setupTabBarOptionsControllerView {
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

- (void)toggleHideTabBarLabels:(UISwitch *)sender {
    if ([sender isOn]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"kHideTabBarLabels"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"kHideTabBarLabels"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)toggleHideExploreTab:(UISwitch *)sender {
    if ([sender isOn]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"kHideExploreTab"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"kHideExploreTab"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)toggleHideShortsTab:(UISwitch *)sender {
    if ([sender isOn]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"kHideShortsTab"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"kHideShortsTab"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)toggleHideUploadTab:(UISwitch *)sender {
    if ([sender isOn]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"kHideUploadTab"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"kHideUploadTab"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)toggleHideSubscriptionsTab:(UISwitch *)sender {
    if ([sender isOn]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"kHideSubscriptionsTab"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"kHideSubscriptionsTab"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)toggleHideLibraryTab:(UISwitch *)sender {
    if ([sender isOn]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"kHideLibraryTab"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"kHideLibraryTab"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

@end