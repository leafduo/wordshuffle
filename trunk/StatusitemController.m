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
	[[menu addItemWithTitle:@"Hide/Reopen" action:@selector(hideOrReopen:) keyEquivalent:@""] setTarget:self];
    [menu addItem: [NSMenuItem separatorItem]];
	[[menu addItemWithTitle:@"Quit" action:@selector(quit:) keyEquivalent:@""] setTarget:self];
	[item setMenu:menu];
}

- (void)hideOrReopen:(id)sender {
	if ([mainWindow isVisible]) {
		[mainWindow close];
	} else {
		[mainWindow orderFront:self];
	}
}

- (void)quit:(id)sender {
	exit(0);
}

@end
