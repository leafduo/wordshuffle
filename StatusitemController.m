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
	[[menu addItemWithTitle:@"Reopen Window" action:@selector(reopenWindow:) keyEquivalent:@""] setTarget:self];
	[item setMenu:menu];
}

- (void)reopenWindow:(id)sender {
	[mainWindow orderFront:self];
}

@end
