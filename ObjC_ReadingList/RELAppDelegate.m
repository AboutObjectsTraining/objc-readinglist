// Copyright (C) 2018 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "RELAppDelegate.h"
#import "RELEditBookController.h"

@implementation RELAppDelegate

- (NSDictionary *)titleAttributes {
    return @{ NSForegroundColorAttributeName : [UIColor colorNamed:@"Title Color"] };
}

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    UINavigationBar.appearance.titleTextAttributes = self.titleAttributes;
    UINavigationBar.appearance.largeTitleTextAttributes = self.titleAttributes;
    
    [UITableViewCell appearanceWhenContainedInInstancesOfClasses:
     @[[RELEditBookController class]]].backgroundColor = [UIColor colorNamed:@"Cell Color"];
}

@end
