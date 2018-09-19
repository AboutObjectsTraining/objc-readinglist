// Copyright (C) 2018 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "RELReadingListController.h"
#import "RELReadingListDataSource.h"
#import <ReadingListModel/ReadingListModel.h>
#import "RELViewBookController.h"

@interface RELReadingListController ()
@property (strong, nonatomic) IBOutlet RELReadingListDataSource *dataSource;
@end

@implementation RELReadingListController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    RELViewBookController *controller = segue.destinationViewController;
    controller.book = [self.dataSource bookAtIndexPath:self.tableView.indexPathForSelectedRow];
}

@end
