// Copyright (C) 2018 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <UIKit/UIKit.h>
#import <ReadingListModel/ReadingListModel.h>

@interface RELAddBookController : UITableViewController

@property (strong, nonatomic) void (^completion)(RLMBook *book);

@end
