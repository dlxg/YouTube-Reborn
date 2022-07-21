#import "DownloadsAudioController.h"
#import "../TheosLinuxFix.h"
#import "../iOS15Fix.h"

@interface DownloadsAudioController ()
- (void)setupDownloadsAudioControllerView;
- (void)setupAudioArrays;
@end

@implementation DownloadsAudioController

NSString *documentsDirectory;
NSMutableArray *filePathsAudioArray;
NSMutableArray *filePathsAudioArtworkArray;

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
    }
    return self;
}

- (void)loadView {
	[super loadView];
    [self setupDownloadsAudioControllerView];

    if (@available(iOS 15.0, *)) {
    	[self.tableView setSectionHeaderTopPadding:0.0f];
	}

    [self setupAudioArrays];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [filePathsAudioArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"AudioDownloadsTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        cell.textLabel.adjustsFontSizeToFitWidth = true;
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
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
    }
    cell.textLabel.text = [filePathsAudioArray objectAtIndex:indexPath.row];
    @try {
        NSString *artworkFileName = filePathsAudioArtworkArray[indexPath.row];
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", [documentsDirectory stringByAppendingPathComponent:artworkFileName]]];
    }
    @catch (NSException *exception) {
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    NSString *currentFileName = filePathsAudioArray[indexPath.row];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:currentFileName];

    AVPlayerViewController *playerViewController = [AVPlayerViewController new];
    playerViewController.player = [AVPlayer playerWithURL:[NSURL fileURLWithPath:filePath]];
    playerViewController.allowsPictureInPicturePlayback = NO;
    if ([playerViewController respondsToSelector:@selector(setCanStartPictureInPictureAutomaticallyFromInline:)]) {
        playerViewController.canStartPictureInPictureAutomaticallyFromInline = NO;
    }
    [playerViewController.player play];

    [self presentViewController:playerViewController animated:YES completion:nil];
}

- (void)tableView:(UITableView*)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath*)indexPath {
    NSString *currentAudioFileName = filePathsAudioArray[indexPath.row];
    NSString *currentArtworkFileName = filePathsAudioArtworkArray[indexPath.row];

    UIAlertController *alertMenu = [UIAlertController alertControllerWithTitle:@"选项" message:nil preferredStyle:UIAlertControllerStyleAlert];

    [alertMenu addAction:[UIAlertAction actionWithTitle:@"删除音频" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [[NSFileManager defaultManager] removeItemAtPath:[documentsDirectory stringByAppendingPathComponent:currentAudioFileName] error:nil];
        [[NSFileManager defaultManager] removeItemAtPath:[documentsDirectory stringByAppendingPathComponent:currentArtworkFileName] error:nil];

        UIAlertController *alertDeleted = [UIAlertController alertControllerWithTitle:@"提示" message:@"音频删除成功" preferredStyle:UIAlertControllerStyleAlert];

        [alertDeleted addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [filePathsAudioArray removeAllObjects];
            [filePathsAudioArtworkArray removeAllObjects];
            [self setupAudioArrays];
            [self.tableView reloadData];
        }]];

        [self presentViewController:alertDeleted animated:YES completion:nil];
    }]];

    [alertMenu addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
    }]];

    [self presentViewController:alertMenu animated:YES completion:nil];
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    [self setupDownloadsAudioControllerView];
    [self.tableView reloadData];
}

@end

@implementation DownloadsAudioController(Privates)

- (void)setupDownloadsAudioControllerView {
    if (@available(iOS 13.0, *)) {
        if (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleLight) {
            self.view.backgroundColor = [UIColor colorWithRed:0.949 green:0.949 blue:0.969 alpha:1.0];
        }
        else {
            self.view.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
        }
    } else {
        self.view.backgroundColor = [UIColor colorWithRed:0.949 green:0.949 blue:0.969 alpha:1.0];
    }
}

- (void)setupAudioArrays {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    documentsDirectory = [paths objectAtIndex:0];

    NSArray *filePathsList = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:documentsDirectory error:nil];
    filePathsAudioArray = [[NSMutableArray alloc] init];
    filePathsAudioArtworkArray = [[NSMutableArray alloc] init];
    for (id object in filePathsList) {
        if ([[object pathExtension] isEqualToString:@"m4a"] || [[object pathExtension] isEqualToString:@"mp3"]){
            [filePathsAudioArray addObject:object];
            NSString *cut = [object substringToIndex:[object length]-4];
            NSString *jpg = [NSString stringWithFormat:@"%@.jpg", cut];
            [filePathsAudioArtworkArray addObject:jpg];
        }
    }
}

@end