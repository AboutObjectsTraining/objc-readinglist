// Copyright (C) 2018 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

#import <UIKit/UIKit.h>

@interface UIStoryboardSegue (RELAdditions)

/**
 If the controller we're interested in is embdedded in a navigation controller, returns
 the navigation controller's first child. Otherwise returns `destinationViewController`.
 */
@property (readonly, nonatomic) UIViewController *rel_destinationViewController;

@end
