// Copyright (C) 2018 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "RELAppDelegate.h"
#import "RELEditBookController.h"
#import "RELAddBookController.h"

@implementation RELAppDelegate

/// Returns visual attributes for the navigation bar's title
- (NSDictionary *)navBarTitleAttributes {
    return @{ NSForegroundColorAttributeName : [UIColor colorNamed:@"Title Color"] };
}

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    [self configureGlobalAppearanceSettings];
}

/**
 Configures `UIAppearance` proxies for several view classes, and sets the window's
 tint color.
 */
- (void)configureGlobalAppearanceSettings {
    self.window.tintColor = [UIColor colorNamed:@"Tint Color"];
    
    UINavigationBar.appearance.titleTextAttributes = self.navBarTitleAttributes;
    UINavigationBar.appearance.largeTitleTextAttributes = self.navBarTitleAttributes;
    
    UITableView.appearance.backgroundColor = [UIColor colorNamed:@"Alternate Cell Color"];
    [UITableViewCell appearanceWhenContainedInInstancesOfClasses:
     @[[RELEditBookController class], [RELAddBookController class]]].backgroundColor = [UIColor colorNamed:@"Cell Color"];
}

/**
 Overridden to send `resignFirstResponder` to the current first responder, if any.
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIApplication.sharedApplication sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

@end
