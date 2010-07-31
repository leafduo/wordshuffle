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
	NSBundle *bundle = [NSBundle	mainBundle];
	NSImage *icon = [[NSImage alloc]initWithContentsOfFile:[bundle pathForResource:@"icon" ofType:@"png"]];
	[item setImage:icon];
	[item setHighlightMode:YES];
	[item setMenu:menu];
}

- (IBAction)selectFile:(id)sender {
	NSOpenPanel *openPanel = [NSOpenPanel openPanel];
	[openPanel beginSheetModalForWindow:mainWindow completionHandler:^(NSInteger result) {
		if (result == NSFileHandlingPanelOKButton) {
			NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
			[defaults setURL:[openPanel URL] forKey:@"wordFilePath"];
		}
	}];
}

- (IBAction)hideOrReopen:(id)sender {
	if ([mainWindow isVisible]) {
		[mainWindow close];
	} else {
		[mainWindow orderFront:self];
	}
}

@end
