// Copyright (C) 2018 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "RELReadingListController.h"
#import "RELReadingListDataSource.h"
#import <ReadingListModel/ReadingListModel.h>
#import "UIStoryboardSegue+RELAdditions.h"
#import "RELViewBookController.h"
#import "RELAddBookController.h"

@interface RELReadingListController ()
@property (strong, nonatomic) IBOutlet RELReadingListDataSource *dataSource;
@end

@implementation RELReadingListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"View Book"]) {
        RELViewBookController *controller = (RELViewBookController *) segue.rel_destinationViewController;
        controller.book = [self.dataSource bookAtIndexPath:self.tableView.indexPathForSelectedRow];
    }
    else {
        RELAddBookController *controller = (RELAddBookController *) segue.rel_destinationViewController;
        typeof(self) __weak weakSelf = self;
        controller.completion = ^(RLMBook *book) { [weakSelf.dataSource addBook:book]; };
    }
}

// MARK: - Unwind segues
- (IBAction)done:(UIStoryboardSegue *)segue {
    [self.tableView reloadData];
    [self.dataSource save];
}

- (IBAction)cancel:(UIStoryboardSegue *)segue {
    // Does nothing
}

@end
