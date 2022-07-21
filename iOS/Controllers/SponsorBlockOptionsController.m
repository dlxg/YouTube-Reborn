#import "SponsorBlockOptionsController.h"
#import "../TheosLinuxFix.h"
#import "../iOS15Fix.h"

@interface SponsorBlockOptionsController ()
- (void)setupSponsorBlockOptionsControllerView;
@end

@implementation SponsorBlockOptionsController

- (void)loadView {
	[super loadView];
    [self setupSponsorBlockOptionsControllerView];

    self.title = @"禁用赞助商选项(Beta)";

    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done)];
    self.navigationItem.rightBarButtonItem = doneButton;

    if (@available(iOS 15.0, *)) {
    	[self.tableView setSectionHeaderTopPadding:0.0f];
	}
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 7;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0 || section == 1 || section == 2 || section == 3 || section == 4 || section == 5 || section == 6) {
        return 1;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"SponsorBlockTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        cell.textLabel.adjustsFontSizeToFitWidth = true;
        cell.accessoryType = UITableViewCellAccessoryNone;
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
            if (indexPath.row == 0) {
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                NSArray *sponsorItemArray = [NSArray arrayWithObjects:@"禁用", @"自动跳过", nil];
                UISegmentedControl *sponsorSegmentedControl = [[UISegmentedControl alloc] initWithItems:sponsorItemArray];
                sponsorSegmentedControl.frame = CGRectMake(0, 5, self.view.bounds.size.width, cell.bounds.size.height - 10);
                [sponsorSegmentedControl addTarget:self action:@selector(actionSponsorSegmentedControl:) forControlEvents:UIControlEventValueChanged];
                if (![[NSUserDefaults standardUserDefaults] integerForKey:@"kSponsorSegmentedInt"]) {
                    sponsorSegmentedControl.selectedSegmentIndex = 0;
                } else {
                    sponsorSegmentedControl.selectedSegmentIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"kSponsorSegmentedInt"];
                }
                [cell addSubview:sponsorSegmentedControl];
            }
        }
        if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                NSArray *selfpromoItemArray = [NSArray arrayWithObjects:@"禁用", @"自动跳过", nil];
                UISegmentedControl *selfpromoSegmentedControl = [[UISegmentedControl alloc] initWithItems:selfpromoItemArray];
                selfpromoSegmentedControl.frame = CGRectMake(0, 5, self.view.bounds.size.width, cell.bounds.size.height - 10);
                [selfpromoSegmentedControl addTarget:self action:@selector(actionSelfPromoSegmentedControl:) forControlEvents:UIControlEventValueChanged];
                if (![[NSUserDefaults standardUserDefaults] integerForKey:@"kSelfPromoSegmentedInt"]) {
                    selfpromoSegmentedControl.selectedSegmentIndex = 0;
                } else {
                    selfpromoSegmentedControl.selectedSegmentIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"kSelfPromoSegmentedInt"];
                }
                [cell addSubview:selfpromoSegmentedControl];
            }
        }
        if (indexPath.section == 2) {
            if (indexPath.row == 0) {
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                NSArray *interactionItemArray = [NSArray arrayWithObjects:@"禁用", @"自动跳过", nil];
                UISegmentedControl *interactionSegmentedControl = [[UISegmentedControl alloc] initWithItems:interactionItemArray];
                interactionSegmentedControl.frame = CGRectMake(0, 5, self.view.bounds.size.width, cell.bounds.size.height - 10);
                [interactionSegmentedControl addTarget:self action:@selector(actionInteractionSegmentedControl:) forControlEvents:UIControlEventValueChanged];
                if (![[NSUserDefaults standardUserDefaults] integerForKey:@"kInteractionSegmentedInt"]) {
                    interactionSegmentedControl.selectedSegmentIndex = 0;
                } else {
                    interactionSegmentedControl.selectedSegmentIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"kInteractionSegmentedInt"];
                }
                [cell addSubview:interactionSegmentedControl];
            }
        }
        if (indexPath.section == 3) {
            if (indexPath.row == 0) {
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                NSArray *introItemArray = [NSArray arrayWithObjects:@"禁用", @"自动跳过", nil];
                UISegmentedControl *introSegmentedControl = [[UISegmentedControl alloc] initWithItems:introItemArray];
                introSegmentedControl.frame = CGRectMake(0, 5, self.view.bounds.size.width, cell.bounds.size.height - 10);
                [introSegmentedControl addTarget:self action:@selector(actionIntroSegmentedControl:) forControlEvents:UIControlEventValueChanged];
                if (![[NSUserDefaults standardUserDefaults] integerForKey:@"kIntroSegmentedInt"]) {
                    introSegmentedControl.selectedSegmentIndex = 0;
                } else {
                    introSegmentedControl.selectedSegmentIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"kIntroSegmentedInt"];
                }
                [cell addSubview:introSegmentedControl];
            }
        }
        if (indexPath.section == 4) {
            if (indexPath.row == 0) {
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                NSArray *outroItemArray = [NSArray arrayWithObjects:@"禁用", @"自动跳过", nil];
                UISegmentedControl *outroSegmentedControl = [[UISegmentedControl alloc] initWithItems:outroItemArray];
                outroSegmentedControl.frame = CGRectMake(0, 5, self.view.bounds.size.width, cell.bounds.size.height - 10);
                [outroSegmentedControl addTarget:self action:@selector(actionOutroSegmentedControl:) forControlEvents:UIControlEventValueChanged];
                if (![[NSUserDefaults standardUserDefaults] integerForKey:@"kOutroSegmentedInt"]) {
                    outroSegmentedControl.selectedSegmentIndex = 0;
                } else {
                    outroSegmentedControl.selectedSegmentIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"kOutroSegmentedInt"];
                }
                [cell addSubview:outroSegmentedControl];
            }
        }
        if (indexPath.section == 5) {
            if (indexPath.row == 0) {
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                NSArray *previewItemArray = [NSArray arrayWithObjects:@"禁用", @"自动跳过", nil];
                UISegmentedControl *previewSegmentedControl = [[UISegmentedControl alloc] initWithItems:previewItemArray];
                previewSegmentedControl.frame = CGRectMake(0, 5, self.view.bounds.size.width, cell.bounds.size.height - 10);
                [previewSegmentedControl addTarget:self action:@selector(actionPreviewSegmentedControl:) forControlEvents:UIControlEventValueChanged];
                if (![[NSUserDefaults standardUserDefaults] integerForKey:@"kPreviewSegmentedInt"]) {
                    previewSegmentedControl.selectedSegmentIndex = 0;
                } else {
                    previewSegmentedControl.selectedSegmentIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"kPreviewSegmentedInt"];
                }
                [cell addSubview:previewSegmentedControl];
            }
        }
        if (indexPath.section == 6) {
            if (indexPath.row == 0) {
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                NSArray *musicofftopicItemArray = [NSArray arrayWithObjects:@"禁用", @"自动跳过", nil];
                UISegmentedControl *musicofftopicSegmentedControl = [[UISegmentedControl alloc] initWithItems:musicofftopicItemArray];
                musicofftopicSegmentedControl.frame = CGRectMake(0, 5, self.view.bounds.size.width, cell.bounds.size.height - 10);
                [musicofftopicSegmentedControl addTarget:self action:@selector(actionMusicOffTopicSegmentedControl:) forControlEvents:UIControlEventValueChanged];
                if (![[NSUserDefaults standardUserDefaults] integerForKey:@"kMusicOffTopicSegmentedInt"]) {
                    musicofftopicSegmentedControl.selectedSegmentIndex = 0;
                } else {
                    musicofftopicSegmentedControl.selectedSegmentIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"kMusicOffTopicSegmentedInt"];
                }
                [cell addSubview:musicofftopicSegmentedControl];
            }
        }
    }
    return cell;
}

- (CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0 || section == 1 || section == 2 || section == 3 || section == 4 || section == 5 || section == 6) {
        return 50;
    }
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"赞助商";
    }
    if (section == 1) {
        return @"自我宣传";
    }
    if (section == 2) {
        return @"互动";
    }
    if (section == 3) {
        return @"介绍";
    }
    if (section == 4) {
        return @"结尾部分";
    }
    if (section == 5) {
        return @"预览";
    }
    if (section == 6) {
        return @"无关音乐";
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    if (@available(iOS 13.0, *)) {
        if (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleLight) {
            view.tintColor = [UIColor colorWithRed:0.949 green:0.949 blue:0.969 alpha:1.0];
        } else {
            view.tintColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
        }
    } else {
        view.tintColor = [UIColor colorWithRed:0.949 green:0.949 blue:0.969 alpha:1.0];
    }
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    [header.textLabel setTextColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"tableSection"]]];
    [header.textLabel setFont:[UIFont systemFontOfSize:14]];
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    [self setupSponsorBlockOptionsControllerView];
    [self.tableView reloadData];
}

@end

@implementation SponsorBlockOptionsController (Privates)

- (void)done {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)setupSponsorBlockOptionsControllerView {
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

- (void)actionSponsorSegmentedControl:(UISegmentedControl *)sender {
    [[NSUserDefaults standardUserDefaults] setInteger:sender.selectedSegmentIndex forKey:@"kSponsorSegmentedInt"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)actionSelfPromoSegmentedControl:(UISegmentedControl *)sender {
    [[NSUserDefaults standardUserDefaults] setInteger:sender.selectedSegmentIndex forKey:@"kSelfPromoSegmentedInt"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)actionInteractionSegmentedControl:(UISegmentedControl *)sender {
    [[NSUserDefaults standardUserDefaults] setInteger:sender.selectedSegmentIndex forKey:@"kInteractionSegmentedInt"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)actionIntroSegmentedControl:(UISegmentedControl *)sender {
    [[NSUserDefaults standardUserDefaults] setInteger:sender.selectedSegmentIndex forKey:@"kIntroSegmentedInt"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)actionOutroSegmentedControl:(UISegmentedControl *)sender {
    [[NSUserDefaults standardUserDefaults] setInteger:sender.selectedSegmentIndex forKey:@"kOutroSegmentedInt"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)actionPreviewSegmentedControl:(UISegmentedControl *)sender {
    [[NSUserDefaults standardUserDefaults] setInteger:sender.selectedSegmentIndex forKey:@"kPreviewSegmentedInt"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)actionMusicOffTopicSegmentedControl:(UISegmentedControl *)sender {
    [[NSUserDefaults standardUserDefaults] setInteger:sender.selectedSegmentIndex forKey:@"kMusicOffTopicSegmentedInt"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end