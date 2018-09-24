// Copyright (C) 2018 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <Foundation/Foundation.h>

@class RLMBook;

@interface RELReadingListDataSource : NSObject

- (RLMBook *)bookAtIndexPath:(NSIndexPath *)indexPath;
- (void)addBook:(RLMBook *)book;
- (void)save;

@end
