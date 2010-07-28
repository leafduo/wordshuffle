//
//  StatusitemController.m
//  WordShuffle
//
//  Created by leafduo on 7/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "StatusitemController.h"


@implementation StatusitemController

- (void)awakeFromNib {
	item = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
	[item retain];
	[item setTitle:@"WS"];
	menu = [[NSMenu alloc] initWithTitle:@"Menu"];
	NSMenuItem *menuItem = [[NSMenuItem alloc] initWithTitle:@"test" action:NULL keyEquivalent:@""];
	[menuItem retain];
	[menu addItem:menuItem];
	[item setMenu:menu];
}

@end
