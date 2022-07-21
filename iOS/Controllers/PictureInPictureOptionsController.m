#import "PictureInPictureOptionsController.h"
#import "../TheosLinuxFix.h"
#import "../iOS15Fix.h"

@interface PictureInPictureOptionsController ()
- (void)setupPictureInPictureOptionsControllerView;
@end

@implementation PictureInPictureOptionsController

- (void)loadView {
	[super loadView];
    [self setupPictureInPictureOptionsControllerView];

    self.title = @"画中画选项";

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
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"PictureInPictureTableViewCell";
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
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.row == 0) {
            cell.textLabel.text = @"启用画中画";
            UISwitch *enablePictureInPicture = [[UISwitch alloc] initWithFrame:CGRectZero];
            [enablePictureInPicture addTarget:self action:@selector(toggleEnablePictureInPicture:) forControlEvents:UIControlEventValueChanged];
            enablePictureInPicture.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"kEnablePictureInPictureVTwo"];
            cell.accessoryView = enablePictureInPicture;
        }
        if (indexPath.row == 1) {
            cell.textLabel.text = @"隐藏画中画广告图标";
            UISwitch *hidePictureInPictureAdsBadge = [[UISwitch alloc] initWithFrame:CGRectZero];
            [hidePictureInPictureAdsBadge addTarget:self action:@selector(toggleHidePictureInPictureAdsBadge:) forControlEvents:UIControlEventValueChanged];
            hidePictureInPictureAdsBadge.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"kHidePictureInPictureAdsBadge"];
            cell.accessoryView = hidePictureInPictureAdsBadge;
        }
        if (indexPath.row == 2) {
            cell.textLabel.text = @"隐藏画中画赞助商图标";
            UISwitch *hidePictureInPictureSponsorBadge = [[UISwitch alloc] initWithFrame:CGRectZero];
            [hidePictureInPictureSponsorBadge addTarget:self action:@selector(toggleHidePictureInPictureSponsorBadge:) forControlEvents:UIControlEventValueChanged];
            hidePictureInPictureSponsorBadge.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"kHidePictureInPictureSponsorBadge"];
            cell.accessoryView = hidePictureInPictureSponsorBadge;
        }
    }
    return cell;
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    [self setupPictureInPictureOptionsControllerView];
    [self.tableView reloadData];
}

@end

@implementation PictureInPictureOptionsController (Privates)

- (void)done {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)setupPictureInPictureOptionsControllerView {
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

- (void)toggleEnablePictureInPicture:(UISwitch *)sender {
    if ([sender isOn]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"kEnablePictureInPictureVTwo"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"kEnablePictureInPictureVTwo"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)toggleHidePictureInPictureAdsBadge:(UISwitch *)sender {
    if ([sender isOn]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"kHidePictureInPictureAdsBadge"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"kHidePictureInPictureAdsBadge"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)toggleHidePictureInPictureSponsorBadge:(UISwitch *)sender {
    if ([sender isOn]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"kHidePictureInPictureSponsorBadge"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"kHidePictureInPictureSponsorBadge"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

@end