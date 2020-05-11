// Copyright (C) 2018 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <ReadingListModel/ReadingListModel.h>
#import "RELEditBookController.h"

@interface RELEditBookController ()
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *yearField;
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (readonly, nonatomic) BOOL hasAuthorInput;
@end

@implementation RELEditBookController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (@available(iOS 13, *)) {
        self.modalInPresentation = true;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self populateBook];
}

- (void)populateBook {
    self.titleField.text = self.book.title;
    self.yearField.text = self.book.year;
    self.firstNameField.text = self.book.author.firstName;
    self.lastNameField.text = self.book.author.lastName;
}

- (void)updateBook
{
    if (!self.book.author && self.hasAuthorInput) {
        self.book.author = [[RLMAuthor alloc] init];
    }
    
    self.book.title = self.titleField.text;
    self.book.year = self.yearField.text;
    self.book.author.firstName = self.firstNameField.text;
    self.book.author.lastName = self.lastNameField.text;
}

- (BOOL)hasAuthorInput {
    NSString *firstName = [self.firstNameField.text
                           stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceCharacterSet];
    NSString *lastName = [self.lastNameField.text
                          stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceCharacterSet];
    return firstName.length > 0 || lastName.length > 0;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Done"]) {
        [self updateBook];
    }
}

@end
