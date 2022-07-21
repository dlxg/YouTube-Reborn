#import "CreditsController.h"
#import "../TheosLinuxFix.h"
#import "../iOS15Fix.h"

@interface CreditsController ()
- (void)setupCreditsControllerView;
@end

@implementation CreditsController

- (void)loadView {
	[super loadView];
    [self setupCreditsControllerView];

    self.title = @"Credits";

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
        return 29;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CreditsTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        cell.textLabel.adjustsFontSizeToFitWidth = true;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if (@available(iOS 13.0, *)) {
            if (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleLight) {
                cell.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
                cell.textLabel.textColor = [UIColor blackColor];
            }
            else {
                cell.backgroundColor = [UIColor colorWithRed:0.110 green:0.110 blue:0.118 alpha:1.0];
                cell.textLabel.textColor = [UIColor whiteColor];
            }
        } else {
            cell.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
            cell.textLabel.textColor = [UIColor blackColor];
        }
        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                cell.textLabel.text = @"Lillie";
                cell.detailTextLabel.text = @"Developer";
            }
        }
        if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                cell.textLabel.text = @"Alpha_Stream";
                cell.detailTextLabel.text = @"Icon Designer, Beta Tester";
            }
            if (indexPath.row == 1) {
                cell.textLabel.text = @"Binny";
                cell.detailTextLabel.text = @"Alpha & Beta Tester";
            }
            if (indexPath.row == 2) {
                cell.textLabel.text = @"Bread Cat";
                cell.detailTextLabel.text = @"Beta Tester";
            }
            if (indexPath.row == 3) {
                cell.textLabel.text = @"Cameren";
                cell.detailTextLabel.text = @"Beta Tester";
            }
            if (indexPath.row == 4) {
                cell.textLabel.text = @"Capt Inc";
                cell.detailTextLabel.text = @"Beta Tester";
            }
            if (indexPath.row == 5) {
                cell.textLabel.text = @"Emma";
                cell.detailTextLabel.text = @"Alpha & Beta Tester";
            }
            if (indexPath.row == 6) {
                cell.textLabel.text = @"Emy";
                cell.detailTextLabel.text = @"Beta Tester";
            }
            if (indexPath.row == 7) {
                cell.textLabel.text = @"Fahrenheight";
                cell.detailTextLabel.text = @"Beta Tester";
            }
            if (indexPath.row == 8) {
                cell.textLabel.text = @"Goodgamer";
                cell.detailTextLabel.text = @"Beta Tester";
            }
            if (indexPath.row == 9) {
                cell.textLabel.text = @"hmuy";
                cell.detailTextLabel.text = @"Beta Tester";
            }
            if (indexPath.row == 10) {
                cell.textLabel.text = @"Joey";
                cell.detailTextLabel.text = @"Beta Tester";
            }
            if (indexPath.row == 11) {
                cell.textLabel.text = @"kirb";
                cell.detailTextLabel.text = @"Development Support, Beta Tester";
            }
            if (indexPath.row == 12) {
                cell.textLabel.text = @"Lans";
                cell.detailTextLabel.text = @"Beta Tester";
            }
            if (indexPath.row == 13) {
                cell.textLabel.text = @"llsc12";
                cell.detailTextLabel.text = @"Beta Tester";
            }
            if (indexPath.row == 14) {
                cell.textLabel.text = @"MasterMike";
                cell.detailTextLabel.text = @"Beta Tester";
            }
            if (indexPath.row == 15) {
                cell.textLabel.text = @"Natalie";
                cell.detailTextLabel.text = @"Beta Tester";
            }
            if (indexPath.row == 16) {
                cell.textLabel.text = @"Nathan";
                cell.detailTextLabel.text = @"Beta Tester";
            }
            if (indexPath.row == 17) {
                cell.textLabel.text = @"oneinanull";
                cell.detailTextLabel.text = @"Beta Tester";
            }
            if (indexPath.row == 18) {
                cell.textLabel.text = @"PoomSmart";
                cell.detailTextLabel.text = @"Features: \"Adblock\", \"AutoPlay In Fullscreen\"";
            }
            if (indexPath.row == 19) {
                cell.textLabel.text = @"Rick";
                cell.detailTextLabel.text = @"Beta Tester";
            }
            if (indexPath.row == 20) {
                cell.textLabel.text = @"Rosie";
                cell.detailTextLabel.text = @"Beta Tester";
            }
            if (indexPath.row == 21) {
                cell.textLabel.text = @"Sarah";
                cell.detailTextLabel.text = @"Alpha & Beta Tester";
            }
            if (indexPath.row == 22) {
                cell.textLabel.text = @"SkyMTF";
                cell.detailTextLabel.text = @"Beta Tester";
            }
            if (indexPath.row == 23) {
                cell.textLabel.text = @"Sloopie";
                cell.detailTextLabel.text = @"Beta Tester";
            }
            if (indexPath.row == 24) {
                cell.textLabel.text = @"Smokin";
                cell.detailTextLabel.text = @"Beta Tester";
            }
            if (indexPath.row == 25) {
                cell.textLabel.text = @"Superuser";
                cell.detailTextLabel.text = @"Beta Tester";
            }
            if (indexPath.row == 26) {
                cell.textLabel.text = @"The_Lucifer";
                cell.detailTextLabel.text = @"Beta Tester";
            }
            if (indexPath.row == 27) {
                cell.textLabel.text = @"Worf";
                cell.detailTextLabel.text = @"Beta Tester";
            }
            if (indexPath.row == 28) {
                cell.textLabel.text = @"Zachary";
                cell.detailTextLabel.text = @"Beta Tester, Features: \"Enable Extra Video Speed\"";
            }
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [theTableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/LillieH001"] options:@{} completionHandler:nil];
        }
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/Kutarin_"] options:@{} completionHandler:nil];
        }
        if (indexPath.row == 1) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/drama_binny"] options:@{} completionHandler:nil];
        }
        if (indexPath.row == 2) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/breadcat0314"] options:@{} completionHandler:nil];
        }
        if (indexPath.row == 3) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/cameren0"] options:@{} completionHandler:nil];
        }
        if (indexPath.row == 4) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/captinc"] options:@{} completionHandler:nil];
        }
        if (indexPath.row == 5) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/nikoyagamer"] options:@{} completionHandler:nil];
        }
        if (indexPath.row == 6) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/Emy"] options:@{} completionHandler:nil];
        }
        if (indexPath.row == 7) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/Fahrenheit"] options:@{} completionHandler:nil];
        }
        if (indexPath.row == 8) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/Goodgamer78"] options:@{} completionHandler:nil];
        }
        if (indexPath.row == 9) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/hmuy0608"] options:@{} completionHandler:nil];
        }
        if (indexPath.row == 10) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/Joey0980"] options:@{} completionHandler:nil];
        }
        if (indexPath.row == 11) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/kirb"] options:@{} completionHandler:nil];
        }
        if (indexPath.row == 12) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/imlans10"] options:@{} completionHandler:nil];
        }
        if (indexPath.row == 13) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/llsc12"] options:@{} completionHandler:nil];
        }
        if (indexPath.row == 14) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/TheMasterOfMike"] options:@{} completionHandler:nil];
        }
        if (indexPath.row == 15) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/CuteNatalie"] options:@{} completionHandler:nil];
        }
        if (indexPath.row == 16) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/verygenericname"] options:@{} completionHandler:nil];
        }
        if (indexPath.row == 17) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/Oneinanull"] options:@{} completionHandler:nil];
        }
        if (indexPath.row == 18) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/PoomSmart"] options:@{} completionHandler:nil];
        }
        if (indexPath.row == 19) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/sahmoee"] options:@{} completionHandler:nil];
        }
        if (indexPath.row == 20) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/deluxe_rosie"] options:@{} completionHandler:nil];
        }
        if (indexPath.row == 21) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/Banaantje04"] options:@{} completionHandler:nil];
        }
        if (indexPath.row == 22) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/SkyMTF"] options:@{} completionHandler:nil];
        }
        if (indexPath.row == 23) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/Sloooopie"] options:@{} completionHandler:nil];
        }
        if (indexPath.row == 24) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/smokin1337"] options:@{} completionHandler:nil];
        }
        if (indexPath.row == 25) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/joshuah345"] options:@{} completionHandler:nil];
        }
        if (indexPath.row == 26) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/the_lucifer0509"] options:@{} completionHandler:nil];
        }
        if (indexPath.row == 27) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/Worf1337"] options:@{} completionHandler:nil];
        }
        if (indexPath.row == 28) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/zachary7829"] options:@{} completionHandler:nil];
        }
    }
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    [self setupCreditsControllerView];
    [self.tableView reloadData];
}

@end

@implementation CreditsController (Privates)

- (void)done {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)setupCreditsControllerView {
    if (@available(iOS 13.0, *)) {
        if (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleLight) {
            self.view.backgroundColor = [UIColor colorWithRed:0.949 green:0.949 blue:0.969 alpha:1.0];
            [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
            self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
        }
        else {
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