// Copyright (C) 2018 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import "UIStoryboardSegue+RELAdditions.h"

@implementation UIStoryboardSegue (RELAdditions)

- (UIViewController *)rel_destinationViewController
{
    UIViewController *controller = self.destinationViewController;
    if (![controller isKindOfClass:[UINavigationController class]]) {
        return controller;
    }
    
    UINavigationController *navController = (UINavigationController *) controller;
    return navController.childViewControllers.firstObject;
}

@end
