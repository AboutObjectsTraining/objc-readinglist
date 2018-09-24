// Copyright (C) 2018 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "RELAddBookController.h"

@interface RELAddBookController ()
@property (readonly, nonatomic) RLMBook *book;
@property (readonly, nonatomic) NSDictionary *bookDictionary;
@property (readonly, nonatomic) NSDictionary *authorDictionary;

@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *yearField;
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@end

@implementation RELAddBookController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.titleField becomeFirstResponder];
}

- (NSDictionary *)authorDictionary {
    return @{ RLMAuthorKeys.firstName: self.firstNameField.text,
              RLMAuthorKeys.lastName: self.lastNameField.text };
}

- (NSDictionary *)bookDictionary {
    return @{ RLMBookKeys.title : self.titleField.text,
              RLMBookKeys.year : self.yearField.text,
              RLMBookKeys.author : self.authorDictionary };
}

- (RLMBook *)book {
    return [[RLMBook alloc] initWithDictionary:self.bookDictionary];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Done"]) {
        self.completion(self.book);
    }
}

@end
