// Copyright (C) 2018 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "RELAppDelegate.h"
#import "RELEditBookController.h"
#import "RELAddBookController.h"
#import "UIColor+RELAdditions.h"

@implementation RELAppDelegate

/// Returns visual attributes for the navigation bar's title
- (NSDictionary *)navBarTitleAttributes {
    return @{ NSForegroundColorAttributeName : UIColor.titleColor };
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    [self configureGlobalAppearanceSettings];
}

/**
 Configures `UIAppearance` proxies for several view classes, and sets the window's
 tint color.
 */
- (void)configureGlobalAppearanceSettings {
    self.window.tintColor = UIColor.tintColor;
    
    UINavigationBar *navBarAppearanceProxy = UINavigationBar.appearance;
    navBarAppearanceProxy.titleTextAttributes = self.navBarTitleAttributes;
    navBarAppearanceProxy.largeTitleTextAttributes = self.navBarTitleAttributes;
    
    UITableView *tableViewAppearanceProxy = UITableView.appearance;
    tableViewAppearanceProxy.backgroundColor = UIColor.alternateCellColor;
    
    UITableViewCell *cellAppearanceProxy = [UITableViewCell appearanceWhenContainedInInstancesOfClasses:
                                            @[RELEditBookController.class, RELAddBookController.class]];
    cellAppearanceProxy.backgroundColor = UIColor.cellColor;
}

/**
 Overridden to send `resignFirstResponder` to the current first responder, if any.
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIApplication.sharedApplication sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

@end
