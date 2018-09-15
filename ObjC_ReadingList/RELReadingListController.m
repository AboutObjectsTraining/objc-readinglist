// Copyright (C) 2018 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "RELReadingListController.h"
#import "RELReadingListDataSource.h"

@interface RELReadingListController ()
@property () RELReadingListDataSource *dataSource;
@end

@implementation RELReadingListController

@end

@implementation RELReadingListController (TableViewDelegate)

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(UITableViewCell *)cell
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
