// Copyright (C) 2018 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <UIKit/UIKit.h>
#import "RELReadingListDataSource.h"

@import ReadingListModel;

@interface RELReadingListDataSource () <UITableViewDataSource>
@property (strong, nonatomic) IBOutlet RLMReadingListStore *store;
@property (strong, nonatomic) RLMReadingList *readingList;
@end


@implementation RELReadingListDataSource

- (RLMReadingList *)readingList {
    if (_readingList == nil) {
        _readingList = self.store.fetchedReadingList;
    }
    return _readingList;
}

- (RLMBook *)bookAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.readingList bookAtIndexPath:indexPath];
}

// MARK: - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.readingList.books.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = indexPath.row % 2 == 0 ? @"Even" : @"Odd";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    RLMBook *book = [self.readingList bookAtIndexPath:indexPath];
    cell.textLabel.text = book.title;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ | %@", book.year, book.author.fullName];
    
    return cell;
}

@end
